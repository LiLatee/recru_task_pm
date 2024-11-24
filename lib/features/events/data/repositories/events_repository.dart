import 'package:either_dart/either.dart';
import 'package:recru_task_pm/core/failure.dart';
import 'package:recru_task_pm/features/events/data/entities/events_page_horizontal_list_item_entity.dart';
import 'package:recru_task_pm/features/events/data/entities/events_page_vertical_list_item_entity.dart';

class EventsRepository {
  Future<Either<Failure, List<EventsPageHorizontalListItemEntity>>> getHorizontalListItems() async {
    await Future.delayed(const Duration(seconds: 2));

    return Future.value(const Right([
      EventsPageHorizontalListItemEntity(
        id: 'id1',
        imageUrl:
            'https://s3-alpha-sig.figma.com/img/b15d/ab1c/8da833b667ec41b42c94d1198244f210?Expires=1733097600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=YDtMZ5KjiJX9oJIYw2gTkoWOgwRrfTg8uCU3IGFtsOJRBTC3~ZRUnhqe4DOS-gZNJqw0ArTiBgyFlBzJk0AHfF~tM3UPImDuXoK5EdXI6a3DnndZKWd-N-Z4gWrJwaZisN4NjqS2Ja4q2c0NepB~NJUDuCmz0ribA0ACNaCzDH~SHqifO8za29Yqe2jODPTNqcum-RcrMTAFXzTAAUV3RaqZP62lA9cxBZMvFigTv-4d31AIQJ5qL9gKfvAvq8eaWC3MtGSEYKBP-yP3BwWs3o864cembiqHrw2WplO~m0OE6WX1-g~amzrZON2ER21CaIUWgkmWty0kTkmHbW7HpA__',
      ),
      EventsPageHorizontalListItemEntity(
        id: 'id2',
        imageUrl:
            'https://s3-alpha-sig.figma.com/img/5989/faea/726411cc0e8f62acaedcbcb390279708?Expires=1733097600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=akFttPgyIAb6b2HlLpgVjE644e7-ujELntPLsHUcUEIM3jLmSdv-gBAQEKye~Dc1OHsLrSwdqxlAtmgcUpUKAg~OCUO8uuXbQSN-BkR3zks6tJEad9S-2c5ijtws2VOlj95BXOcQCG9r1CqWnngyIRVEYYWWg6bV~Qm83Fg1hFzXBMP7kujLFtEkhJE1YiAyzTlllHO2SHtkolE0QQ~zNscuJkSJlIdhhnayd6LoGcjwrauRtZjmRQQ7NvBGezoiryFzCiQS~LeGQvr6sKr73OXquUozaZgkzzK42YQU~~xUySRHmrFtZo2hgcH~IPEnelhSFUCpbIPt6AAY6x5pbA__',
      ),
      EventsPageHorizontalListItemEntity(
        id: 'id3',
        imageUrl:
            'https://s3-alpha-sig.figma.com/img/b15d/ab1c/8da833b667ec41b42c94d1198244f210?Expires=1733097600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=YDtMZ5KjiJX9oJIYw2gTkoWOgwRrfTg8uCU3IGFtsOJRBTC3~ZRUnhqe4DOS-gZNJqw0ArTiBgyFlBzJk0AHfF~tM3UPImDuXoK5EdXI6a3DnndZKWd-N-Z4gWrJwaZisN4NjqS2Ja4q2c0NepB~NJUDuCmz0ribA0ACNaCzDH~SHqifO8za29Yqe2jODPTNqcum-RcrMTAFXzTAAUV3RaqZP62lA9cxBZMvFigTv-4d31AIQJ5qL9gKfvAvq8eaWC3MtGSEYKBP-yP3BwWs3o864cembiqHrw2WplO~m0OE6WX1-g~amzrZON2ER21CaIUWgkmWty0kTkmHbW7HpA__',
      ),
      EventsPageHorizontalListItemEntity(
        id: 'id4',
        imageUrl:
            'https://s3-alpha-sig.figma.com/img/5989/faea/726411cc0e8f62acaedcbcb390279708?Expires=1733097600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=akFttPgyIAb6b2HlLpgVjE644e7-ujELntPLsHUcUEIM3jLmSdv-gBAQEKye~Dc1OHsLrSwdqxlAtmgcUpUKAg~OCUO8uuXbQSN-BkR3zks6tJEad9S-2c5ijtws2VOlj95BXOcQCG9r1CqWnngyIRVEYYWWg6bV~Qm83Fg1hFzXBMP7kujLFtEkhJE1YiAyzTlllHO2SHtkolE0QQ~zNscuJkSJlIdhhnayd6LoGcjwrauRtZjmRQQ7NvBGezoiryFzCiQS~LeGQvr6sKr73OXquUozaZgkzzK42YQU~~xUySRHmrFtZo2hgcH~IPEnelhSFUCpbIPt6AAY6x5pbA__',
      ),
    ]));
  }

  Stream<Either<Failure, List<EventsPageVerticalListItemEntity>>> streamVerticalListItems() {
    return Stream.fromIterable(
      [
        Right(
          [
            EventsPageVerticalListItemEntity(
              id: 'id1',
              imageUrl:
                  'https://s3-alpha-sig.figma.com/img/ae19/c24a/a08680e3cc55d9d937a3490b188eef3c?Expires=1733097600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=ZwBwRerlvOUi4~HygC5K5b~XvK9nvu29~Y6j5Rj3Im1LRf6i~E~3oGsM19BsdmohUsBJiXOdAsLrAQ7j2skVgursn73TD0MEGYm3c-Nwi9xcCugZpf~NkBrwTNkRR1PB0DRlH8DbcEgvyJcrCmqmw6LRrBCYtg9Qw91kv1TpL73AMm7-CJWmj0c16htw87GJBp1Dt57WWxPLkFGlz1dqqhOKNDtSFEJ-3hgROL9BbeJ41nzg2ulVs6yNNrdJB7FGY4y2WjZBRxqZH2ZzyePslQgsNCA7HXfaK4aVceqhHE-0DN9NNcJYVXVyf~xtigCyBOb7UTXwfh2mNVtQH9Kdug__',
              title: 'Gala muzyki filmowej',
              place: 'Spodek, Katowice',
              liked: true,
              startDate: DateTime(2024, 9, 3),
              endDate: null,
            ),
            EventsPageVerticalListItemEntity(
              id: 'id2',
              imageUrl:
                  'https://s3-alpha-sig.figma.com/img/c9c3/d3f6/d2a85feeab9ab1d5dae894a0d679686d?Expires=1733097600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=SXknWkalhyVzXoSpe0A1kBAxvHxXBsAZnBOH1u2gI61czCcS5Q1Esdf8TtY7lIOVusOKsF21yUqMLfFhII1wk2GTK3BnmvmLtf4Ik6x4MsZDhhe3FzrbkI4McltMp-A6iJlGNcNjmEagCOqqpkC21YgzP-sns89rfApA5Ntc2qGzsQ7segcJ-voeHphko4wDL-aw0rjLbb3e73W0ZrVchiEEfLC4nkLUcE~TuoyEziGuUXXfyeSiCR6kcZlXU268Ae-9gKgBOZLwuIa49ESQaDOttnHmotcVuRNkb2YH9GEZ-gMCu-atCfjogJigEhwWuVNbWxNiJpxVzarRkWYMbA__',
              title: 'Stanisław Bober fotografia',
              place: 'Miejski ośrodek Kultury, Katowice',
              liked: false,
              startDate: DateTime(2024, 9, 23),
              endDate: DateTime(2024, 10, 12),
            ),
            EventsPageVerticalListItemEntity(
              id: 'id3',
              imageUrl:
                  'https://s3-alpha-sig.figma.com/img/7d77/6480/c7ec2bb68f47056d1ddba49994abbdd1?Expires=1733097600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=lyPxWexk9iaeAUdPMhmuoHj5C4Iwy3Z0dvqfEk~rfHVYSyI0b~v7B5O9Kq6KurwQOG6jwjcsxIud4c7yapbnu2ie77wEIzHsJSIhQh6qkIwh~YqbRKPp0eRDw1uk0pIBA5ZBiB5ukECqM5cNbJ6uih-4tJ17cFKBXvqqS4JpQ43DpkERAmmFy5ClxxchcUrFDYfHlfHeY52hHFR90PeHQO~QqvI6YixeJxMbzDS1rHn19Qh8YHDkBX8yD7ZJjF7Ybk8TbkO7T2OJWyRT4q9sEdXCxIpsZKrpq2aLyRy9mXdvv8qlNhqAB6Z8OizuG5I97dezEgc6cOEtm9l3fE~Dzg__',
              title: 'Dziedzictwo kultury a proces inwestycyjny',
              place: 'Muzeum Śląskie, Katowice',
              liked: false,
              startDate: DateTime(2024, 9, 23),
              endDate: DateTime(2024, 10, 12),
            ),
            EventsPageVerticalListItemEntity(
              id: 'id4',
              imageUrl:
                  'https://s3-alpha-sig.figma.com/img/97d2/d3d3/1ea7357e159d79672d37c67a6524b1a2?Expires=1733097600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=jk2MwMd1S5Di9~pujXJ2pTnmnNlRKIyI0ENN2HifHwRSWU5ZVC-MMjm1iNTAXzH8jU-AmhYEIh88JQ4PrM3O4sSHbmmU8Izb3xw6T1OJfpQKYlRTij0LLCdf94Ga9uSxAlMAlDqPVZEgYjM---IblrqduspLlHJd2nkx6AZLFHuGI5PfIFKf72TPCvY4nSBOuDTjlEDyCibDuAwocqcJj-EjSC2rIv2Zu-DZYIw0Q5EgaAEk2dsePmbNyBrjYFJ-1RRfDvGwwOQIgHdjjTJddR0uJT3qIwgkfzQ2NbydphVOtfyFiNXHnhtpCeIryfQex3zzy8DtLp~a7CeL19AHaA__',
              title: 'Gala muzyki filmowej',
              place: 'Młodzieżowy Dom Kultury,  Bielsko-Biała',
              liked: false,
              startDate: DateTime(2024, 10, 12),
              endDate: null,
            ),
            EventsPageVerticalListItemEntity(
              id: 'id4',
              imageUrl:
                  'https://s3-alpha-sig.figma.com/img/4e1c/c38e/a3366604727a0dba247dc854635b6228?Expires=1733097600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Z~CYUqdGc8jn9rb5x4jORqMd6OArOD97y0pejQx-X7crHRt4MCX5fTk8he9RQXSL~H~759swGf0ARpxm2TpAI~Cvx438JX04oeQ0nxNEPjtgh0FUl4c6d1K7lxo-EWGLZ~AsjDxxHQe9Wy5eVrJTACfT2ZizrcSKjSV3dO~wv-yTYYo0DdR9y~ukvpbYFy-waJHuczb~YLKUT85ws3jvFob3-tdyWuZYN-JxWxI1dw1sK1f0lJdiwG~pDdToMBysfSTYmTYk2vaYIi4V9-GsbuK2IJTVqX6kw3x98k-OOzOFu17UUarAmdA7LjeIuIfN3GS8kdoPhVOfS6927C7qsw__',
              title: 'Gala muzyki filmowej',
              place: 'Młodzieżowy Dom Kultury,  Bielsko-Biała',
              liked: false,
              startDate: DateTime(2024, 10, 12),
              endDate: null,
            ),
          ],
        ),
      ],
    );
  }
}
