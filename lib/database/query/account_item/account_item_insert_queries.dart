class AccountItemInsertQueries {
  static const String insertMAccountItem = "INSERT INTO M_ACCOUNT_ITEM"
      "("
      "ACCOUNT_ID"
      ",DEBIT_CREDIT_DIV"
      ", MAJOR_ITEM_ID"
      ", MIDDLE_ITEM_ID"
      ")VALUES"
      "('ee3bf95a-4e51-8065-39f9-5d22f6d84e79',0,'627a717e-db33-48b5-0095-2034c9945ba4','8aa3bcb8-dce3-38c5-7244-217a79470abf'),"
      "('42da3b27-aedd-4d7c-cffc-108ddedebf70',0,'3c676441-03e9-46b2-3010-04ef9e22d32e','c1316201-5086-1857-69f7-e34e5dae38a8'),"
      "('081c37f8-e2e3-b79a-b6c6-31e12d523b13',0,'434426ae-3915-e89e-0bdd-bb565dae11b6','36e7a693-b7cc-2313-30bf-e33ebb95ed39'),"
      "('4d91941d-ec4c-c026-d951-b5deaea88df5',0,'39347ebd-4fee-9d55-513f-cd76af27472b','b2c786f0-6e15-e94c-544f-29a0ba24b652'),"
      "('03b194f4-3b40-87f5-e014-c04e232c1cf7',0,'35098ba1-b600-c38e-d78e-0188ea092bdf','780392a3-1538-842b-55db-d7f0113b6234'),"
      "('1fbe8ccd-0c78-251f-9408-3f6d174d2e30',0,'187e35eb-ad15-bd28-396f-12c81abc0e44','8b62a4bf-3b9a-5e0c-21fe-c6f37bf31651'),"
      "('e7480c49-19b5-a638-9795-289ed58abdeb',0,'4a1699cd-c55d-91f6-b622-6a6c36c15bac','bd48e984-f42f-7314-dfcf-cdf563a5eceb'),"
      "('8e17fd4b-52b2-fcde-af5e-1522800f059f',0,'b335fe20-2260-e5cc-b68d-d1e9833e2c8e','423ff5e5-b2b9-1a68-60ae-23eeaee7747d'),"
      "('cdc2c0cc-adea-044f-1180-c479f57ba62e',0,'f4d08642-676c-badc-9c77-efb3daf5234b','7aadbadd-e4c5-f419-2d7a-4d8c29837647'),"
      "('8fc3159a-b5a3-6665-0fa9-7dec25cef74b',0,'0df27364-1af9-1b92-c6d9-264ccb03b099','1ee167fd-65ee-a96b-ec04-e38d6e9adf3f'),"
      "('a3b8e758-c87c-a5b0-404d-34b1dc0eead9',0,'21357f75-3bec-bb42-4bda-5a4e33b808c2','5c2a91ad-0993-f141-6017-bd197d221c8a'),"
      "('8f231f44-3745-dfe6-0d14-fa764ec09688',0,'04f86e06-2bb0-dcad-70bf-15ff5803fa27','afe54bd1-6cb6-6486-8227-769627de3391'),"
      "('8cc861b3-6fd5-0da5-4d3e-de37740af718',0,'c95ef548-33ca-11a6-d2fa-f22169434cf5','ff8ce1aa-6eb7-3dae-38b7-312b09eab7bf'),"
      "('7706229a-5032-df9a-7c5a-1b0938f7830d',0,'90392ec8-6810-c195-af41-fa8ba6be14e5','6df7fab0-f13b-21ea-669b-cc0a45bcde33'),"
      "('febd6e42-eee6-772c-0cdb-796a8562f806',0,'225326d5-3cac-9d4f-3754-1d3e1af3e9fe','11eb0eef-1a9c-2933-3859-ff6d8fd01496'),"
      "('85c78112-7f58-15c0-a6da-664ef9325836',0,'6a49d233-41e8-17c9-2e6c-c16ce0a1edb6','5cf3810f-dbe5-c107-11bf-696855f77445'),"
      "('6d6b645a-a088-b6e1-eb92-338f395fe3d0',0,'17731eea-fe15-bfd4-cbd8-b4e5ca308eb3','895e75c2-545a-092f-c8c2-ab476d7c0fed'),"
      "('dba20a90-b648-f887-34a6-9fb749bfab06',0,'0c52eca9-a3e3-db68-a165-fe2548280e42','b0c29e38-582a-f0fd-e7d9-c3ce4e116253'),"
      "('28611105-3b0e-b9ef-6770-4d73b0d7e833',0,'5c86ebcf-def8-0f2e-5dd6-c4b9d1c155af','9fcf83ea-c000-644a-0007-23b495f53222'),"
      "('ffc63d52-b7a5-7af9-efaa-282a525357cf',1,'a82bfdec-45f2-d8ac-613b-2f3d3438fabf','6cc48c56-1141-a42b-d1a1-52c497dce6a8'),"
      "('4bb840d1-517b-55f8-0fa3-a00eb95356a0',1,'940b10ab-02e6-92a9-85a0-49c89bdf41f0','dec78954-e175-73d1-ab6a-d19f4f72b47e'),"
      "('d78dc7d9-c066-6122-9b05-5bb97a124342',1,'9d48af29-a597-16d4-c9fc-8342387ec17a','0914c733-093a-cf85-3666-e09462ece604'),"
      "('d72a670b-d796-4938-dec3-984b236de80d',1,'583590cc-9508-1fb0-66df-cee50045fbe8','0e0e7988-9af0-10de-481e-edeb228696e6'),"
      "('8b922faa-d6a3-3fb1-1ca8-51c59f2c58a0',1,'6acda6fd-6fb6-4955-6b75-c3eb7f6b9465','ae47d7d8-39ff-47fe-97c7-86a7e835ce0c'),"
      "('938ec738-99ab-a400-75d5-93890e1e6b26',1,'b02b75be-40a0-930e-6d7c-8e16d1a0559d','fb9fb97a-ead5-3b61-fdc3-b8aa7bae8fde'),"
      "('1459f641-3e95-ef7d-2dc3-7a479c9e7274',1,'e603f211-248f-0e45-d124-95bda4d2cab3','480e1806-8248-a2f7-66be-e41df2a2ee51'),"
      "('5fc03b74-6105-aa08-c35a-826a232e7418',1,'d8253e0e-40d0-48b6-f772-fc3c48002914','66745e42-b44e-dcbe-dcbf-4331aa705436'),"
      "('cb65c7af-664b-6c35-c183-eb0d41895d92',1,'4f131590-e4da-b494-2329-c381053717a2','8dca7881-877a-e35a-8682-588e71d6455c'),"
      "('de571b66-0925-4e7b-c7a9-f353613c5ce6',1,'e6fe6669-6990-7f01-c011-7ca84efcf463','1e0ed829-5d3c-dfa0-98e7-ee561afad0a5'),"
      "('db9e318f-bcfe-30c2-540a-de7b31ba4219',1,'875429d7-a201-2e66-2301-50cbb7310da3','b2f479b6-d3c0-dce5-ab69-2952dc105531'),"
      "('fef6155a-49ef-ba5c-dfa0-7e2d6a0d32a1',1,'11215c63-a751-4fb8-bee3-26ad1d4a6362','440f0073-013c-e6c5-97d1-5aa0b0741248')";

  static const String insertMAccountMajorItem =
      "INSERT INTO M_ACCOUNT_MAJOR_ITEM"
      "("
      "MAJOR_ITEM_ID"
      ",MAJOR_ITEM_NAME"
      ")VALUES"
      "('627a717e-db33-48b5-0095-2034c9945ba4','資産'),"
      "('3c676441-03e9-46b2-3010-04ef9e22d32e','資産'),"
      "('434426ae-3915-e89e-0bdd-bb565dae11b6','資産'),"
      "('39347ebd-4fee-9d55-513f-cd76af27472b','資産'),"
      "('35098ba1-b600-c38e-d78e-0188ea092bdf','資産'),"
      "('187e35eb-ad15-bd28-396f-12c81abc0e44','資産'),"
      "('4a1699cd-c55d-91f6-b622-6a6c36c15bac','費用'),"
      "('b335fe20-2260-e5cc-b68d-d1e9833e2c8e','費用'),"
      "('f4d08642-676c-badc-9c77-efb3daf5234b','費用'),"
      "('0df27364-1af9-1b92-c6d9-264ccb03b099','費用'),"
      "('21357f75-3bec-bb42-4bda-5a4e33b808c2','費用'),"
      "('04f86e06-2bb0-dcad-70bf-15ff5803fa27','費用'),"
      "('c95ef548-33ca-11a6-d2fa-f22169434cf5','費用'),"
      "('90392ec8-6810-c195-af41-fa8ba6be14e5','費用'),"
      "('225326d5-3cac-9d4f-3754-1d3e1af3e9fe','費用'),"
      "('6a49d233-41e8-17c9-2e6c-c16ce0a1edb6','費用'),"
      "('17731eea-fe15-bfd4-cbd8-b4e5ca308eb3','費用'),"
      "('0c52eca9-a3e3-db68-a165-fe2548280e42','費用'),"
      "('5c86ebcf-def8-0f2e-5dd6-c4b9d1c155af','費用'),"
      "('a82bfdec-45f2-d8ac-613b-2f3d3438fabf','負債'),"
      "('940b10ab-02e6-92a9-85a0-49c89bdf41f0','負債'),"
      "('9d48af29-a597-16d4-c9fc-8342387ec17a','負債'),"
      "('583590cc-9508-1fb0-66df-cee50045fbe8','資本'),"
      "('6acda6fd-6fb6-4955-6b75-c3eb7f6b9465','資本'),"
      "('b02b75be-40a0-930e-6d7c-8e16d1a0559d','収益'),"
      "('e603f211-248f-0e45-d124-95bda4d2cab3','収益'),"
      "('d8253e0e-40d0-48b6-f772-fc3c48002914','収益'),"
      "('4f131590-e4da-b494-2329-c381053717a2','収益'),"
      "('e6fe6669-6990-7f01-c011-7ca84efcf463','収益'),"
      "('875429d7-a201-2e66-2301-50cbb7310da3','収益'),"
      "('11215c63-a751-4fb8-bee3-26ad1d4a6362','収益')";

  static const String insertMAccountMiddleItem =
      "INSERT INTO M_ACCOUNT_MIDDLE_ITEM"
      "("
      "MAJOR_ITEM_ID"
      ",MIDDLE_ITEM_ID"
      ",MIDDLE_ITEM_NAME"
      ")VALUES"
      "('627a717e-db33-48b5-0095-2034c9945ba4','8aa3bcb8-dce3-38c5-7244-217a79470abf','現金'),"
      "('3c676441-03e9-46b2-3010-04ef9e22d32e','c1316201-5086-1857-69f7-e34e5dae38a8','当座預金'),"
      "('434426ae-3915-e89e-0bdd-bb565dae11b6','36e7a693-b7cc-2313-30bf-e33ebb95ed39','建物'),"
      "('39347ebd-4fee-9d55-513f-cd76af27472b','b2c786f0-6e15-e94c-544f-29a0ba24b652','土地'),"
      "('35098ba1-b600-c38e-d78e-0188ea092bdf','780392a3-1538-842b-55db-d7f0113b6234','有価証券'),"
      "('187e35eb-ad15-bd28-396f-12c81abc0e44','8b62a4bf-3b9a-5e0c-21fe-c6f37bf31651','電子マネー'),"
      "('4a1699cd-c55d-91f6-b622-6a6c36c15bac','bd48e984-f42f-7314-dfcf-cdf563a5eceb','家賃'),"
      "('b335fe20-2260-e5cc-b68d-d1e9833e2c8e','423ff5e5-b2b9-1a68-60ae-23eeaee7747d','支払利息'),"
      "('f4d08642-676c-badc-9c77-efb3daf5234b','7aadbadd-e4c5-f419-2d7a-4d8c29837647','食費'),"
      "('0df27364-1af9-1b92-c6d9-264ccb03b099','1ee167fd-65ee-a96b-ec04-e38d6e9adf3f','保険料'),"
      "('21357f75-3bec-bb42-4bda-5a4e33b808c2','5c2a91ad-0993-f141-6017-bd197d221c8a','旅費交通費'),"
      "('04f86e06-2bb0-dcad-70bf-15ff5803fa27','afe54bd1-6cb6-6486-8227-769627de3391','通信費'),"
      "('c95ef548-33ca-11a6-d2fa-f22169434cf5','ff8ce1aa-6eb7-3dae-38b7-312b09eab7bf','消耗品費'),"
      "('90392ec8-6810-c195-af41-fa8ba6be14e5','6df7fab0-f13b-21ea-669b-cc0a45bcde33','水道光熱費'),"
      "('225326d5-3cac-9d4f-3754-1d3e1af3e9fe','11eb0eef-1a9c-2933-3859-ff6d8fd01496','税金'),"
      "('6a49d233-41e8-17c9-2e6c-c16ce0a1edb6','5cf3810f-dbe5-c107-11bf-696855f77445','有価証券売却損'),"
      "('17731eea-fe15-bfd4-cbd8-b4e5ca308eb3','895e75c2-545a-092f-c8c2-ab476d7c0fed','固定資産売却損'),"
      "('0c52eca9-a3e3-db68-a165-fe2548280e42','b0c29e38-582a-f0fd-e7d9-c3ce4e116253','手数料'),"
      "('5c86ebcf-def8-0f2e-5dd6-c4b9d1c155af','9fcf83ea-c000-644a-0007-23b495f53222','サービス費'),"
      "('a82bfdec-45f2-d8ac-613b-2f3d3438fabf','6cc48c56-1141-a42b-d1a1-52c497dce6a8','借入金'),"
      "('940b10ab-02e6-92a9-85a0-49c89bdf41f0','dec78954-e175-73d1-ab6a-d19f4f72b47e','未払金'),"
      "('9d48af29-a597-16d4-c9fc-8342387ec17a','0914c733-093a-cf85-3666-e09462ece604','預り金'),"
      "('583590cc-9508-1fb0-66df-cee50045fbe8','0e0e7988-9af0-10de-481e-edeb228696e6','資本金'),"
      "('6acda6fd-6fb6-4955-6b75-c3eb7f6b9465','ae47d7d8-39ff-47fe-97c7-86a7e835ce0c','利益剰余金'),"
      "('b02b75be-40a0-930e-6d7c-8e16d1a0559d','fb9fb97a-ead5-3b61-fdc3-b8aa7bae8fde','給料'),"
      "('e603f211-248f-0e45-d124-95bda4d2cab3','480e1806-8248-a2f7-66be-e41df2a2ee51','商品売買益'),"
      "('d8253e0e-40d0-48b6-f772-fc3c48002914','66745e42-b44e-dcbe-dcbf-4331aa705436','受取家賃'),"
      "('4f131590-e4da-b494-2329-c381053717a2','8dca7881-877a-e35a-8682-588e71d6455c','有価証券売却益'),"
      "('e6fe6669-6990-7f01-c011-7ca84efcf463','1e0ed829-5d3c-dfa0-98e7-ee561afad0a5','固定資産売却益'),"
      "('875429d7-a201-2e66-2301-50cbb7310da3','b2f479b6-d3c0-dce5-ab69-2952dc105531','受取利息'),"
      "('11215c63-a751-4fb8-bee3-26ad1d4a6362','440f0073-013c-e6c5-97d1-5aa0b0741248','雑収入')";
}
