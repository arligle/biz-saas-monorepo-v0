import { Injectable } from "@nestjs/common";
// biome-ignore lint/style/useImportType: <explanation>
import { ConfigService } from "@nestjs/config";
import { isNil } from "lodash";

@Injectable()
export class AppConfigService {
  constructor(private readonly configService: ConfigService) { }
  private get(key: string): string {
    const value = this.configService.get<string>(key);
    if (isNil(value)) {
      throw new Error(`${key} 环境变量没有设置`); // probably we should call process.exit() too to avoid locking the service
    }
    return value;
  }


  private getString(key: string): string {
    const value = this.get(key);
    return value.replaceAll('\\n', '\n');
  }

  get appConfig() {
    return {
      port: this.getString('PORT'),
    };
  }
}