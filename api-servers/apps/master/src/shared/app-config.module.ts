import type { Provider } from '@nestjs/common';
import { Global, Module } from '@nestjs/common';
import { AppConfigService } from './services/app-config.service';

const providers: Provider[] = [
  AppConfigService,
];

@Global()
@Module({
  providers,
  imports: [],
  exports: [...providers],
})
export class AppConfigModule { }
