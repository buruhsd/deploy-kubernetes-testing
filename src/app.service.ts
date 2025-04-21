import { Injectable } from '@nestjs/common';

@Injectable()
export class AppService {
  getHello(): string {
    return 'perubahan terbaru, harusnya cepat!';
  }
}
