import { DocumentBuilder } from '@nestjs/swagger';

export class BaseAPIDocumentation {
  public builder = new DocumentBuilder();

  public initializeOptions() {
    return this.builder
      .setTitle('Hello API Server')
      .setDescription('AWS 배포용 nginx Hello API 서버입니다.')
      .setVersion('1.0')
      .build();
  }
}
