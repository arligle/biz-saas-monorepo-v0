import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { Logger } from '@nestjs/common';
import { AppConfigModule } from './shared/app-config.module';
import { AppConfigService } from './shared/services/app-config.service';

async function bootstrap() {
  const logger = new Logger('Main');
  const app = await NestFactory.create(AppModule);
  const configService = app.select(AppConfigModule).get(AppConfigService);
  const port = configService.appConfig.port;
  await app.listen(port);
  logger.log(`Server is running on: ${await app.getUrl()}`)
}
bootstrap();
