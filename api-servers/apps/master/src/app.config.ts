import { registerAs } from '@nestjs/config';

export default registerAs('app', () => ({
  url: process.env.APP_URL,
  port: Number(process.env.PORT || 3000),
  gracefulShutdownTimeout: Number(process.env.GRACEFUL_SHUTDOWN_TIMEOUT || 0),
  database_url: process.env.DATABASE_URL,
}));
