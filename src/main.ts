import { NestFactory } from '@nestjs/core';

import * as helmet from 'helmet';

import { AppModule } from './app.module';

const port = process.env.PORT || 4000;
const msg = () => console.log(`App on: http://localhost:${port}/`);

async function bootstrap() {
  const app = await NestFactory.create(AppModule);

  app.enableCors({
    origin: (req, callback) => callback(null, true),
  });
  app.use(helmet());

  await app.listen(port);
}
bootstrap().then(msg);
