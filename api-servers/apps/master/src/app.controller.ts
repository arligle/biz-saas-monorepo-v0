import { Controller, Get } from '@nestjs/common';
// biome-ignore lint/style/useImportType: <代码参与运行时>
import { AppService } from './app.service';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) { }

  @Get()
  getHello(): string {
    return this.appService.getHello();
  }
}
