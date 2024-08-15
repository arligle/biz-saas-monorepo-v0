import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { DrizzlePGModule } from '@ifc-drizzle/node-postgres';
import * as schema from 'libs/biz-saas-db-schema/src';

@Module({
  imports: [
    DrizzlePGModule.registerAsync({
      tag: 'DB_PROD',
      useFactory() {
        return {
          pg: {
            connection: 'client',
            config: {
              connectionString: process.env.DATABASE_URL,
            },
          },
          config: { schema: { ...schema } },
        };
      },
    }),

  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule { }
