import { Controller, Get } from '@nestjs/common';
import { AppService } from './app.service';
import { ApiResponse, ApiOperation, ApiTags } from '@nestjs/swagger';

@ApiTags('Hello App')
@Controller('/hello')
export class AppController {
  constructor(private readonly appService: AppService) {}

  @ApiOperation({ description: 'Hello를 return합니다', summary: 'Get Hello' })
  @ApiResponse({
    schema: { example: 'Hello' },
    status: 200,
    description: 'Hello를 return합니다',
  })
  @Get()
  getHello(): string {
    return this.appService.getHello();
  }
}
