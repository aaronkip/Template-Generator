'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "8df98af8e563ec9aff6598482cd7280f",
"splash/img/light-2x.png": "2d9b17fa4e4ecbc711c838fa5b903c18",
"splash/img/light-3x.png": "e6854e8554dd5216edd8d93e70670117",
"splash/img/dark-3x.png": "e6854e8554dd5216edd8d93e70670117",
"splash/img/dark-2x.png": "2d9b17fa4e4ecbc711c838fa5b903c18",
"splash/img/dark-1x.png": "4485d4d6ec1ccc89f93c3fd4838d0e50",
"splash/img/light-1x.png": "4485d4d6ec1ccc89f93c3fd4838d0e50",
"splash/style.css": "f8e8383c64b765de4871c2b23e30b102",
"index.html": "361903d31751138bd3f360d636fc4997",
"/": "361903d31751138bd3f360d636fc4997",
"main.dart.js": "06cb6a371c290ccd49b69cef2d0b3355",
"404.html": "0a27a4163254fc8fce870c8cc3a3f94f",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "7468e730c5eb1b1e6ff7e9fc41bc006a",
".git/config": "20cfffc6e90f850670ab78cf56316028",
".git/objects/0d/0df08f7c3e147a8ae36017cf81a96e35b73717": "106e868f28a72727fb6fb0fa71123633",
".git/objects/92/65271423f84461d77884d2951fb8bc3d1fd82a": "b19ea62170f08eea8d0867d33c16947d",
".git/objects/57/a72fb40da58566a887f9985dae42e204d4828f": "37f8f82b8b08eef13a6dbd907ec1aa97",
".git/objects/3b/4f2044b8ba9bbeefa18feff4ff28f5371b12bc": "a3b6d9728f6f2d4eb65eeac0db22e0a0",
".git/objects/9e/26dfeeb6e641a33dae4961196235bdb965b21b": "304148c109fef2979ed83fbc7cd0b006",
".git/objects/32/46ad559eeae0370195978eaed83f1053ee13fd": "a043dbc0a0bda96ce2127799ccc27506",
".git/objects/35/d940d9d8c54bfac4dc11e92763e2ef29eb1e6d": "107a36ae302dc18226b98121b0f8570f",
".git/objects/51/81fecc0dfe790571863d9c1ccaff73d442fe94": "584ce90bc14c262de767d58056cf6987",
".git/objects/58/1a37ccb659648288e865dc8de6f7a80e1b32a7": "d99141aaab39817d4d2d81748aeae262",
".git/objects/67/2e9e49d2f0c4c8aa44b496beb98f32cb36720e": "8b66be9a4797f8f3922fb5816494c68e",
".git/objects/93/3cc3d1aaab53770e9833f391aa20dc54668590": "4afe2be01096515b32f07ec72319e5b0",
".git/objects/05/534b43693dcb6e9046de97b68d446ca86a90ef": "0203d28ae9dfb7fa310bb6f2f9caa56c",
".git/objects/02/6946f4136928ca746be7608c2429e0b2d9f2f0": "2a7fb769bc5ce23e14c8e96f2881b162",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/d8/a51b4f101fea321910bb62ea09071af9bcf5a7": "7f10c2d699cf1052d92c2cf791b16cf7",
".git/objects/f3/157f92409d9dab858f13e7cc686112902de25b": "48bbf49709381c5a8b1bec176ad2e3ab",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/c6/b311d4d1d69f60508eab9de93ed18b5fd62893": "585b2ddbd10410d88c4a2e337cfcd99e",
".git/objects/4e/89617a3696bd10c155ec378f4a65a9f89e9e3a": "d8056e20bae90d092b619c895129e982",
".git/objects/29/76fd1592c99bb7483492fd30ebc3416b5f1aa6": "7f5b4e81fa7b6c31461789fdc86b89ca",
".git/objects/7c/6a78532b44aedfa8357786aab63b5351d8fd71": "cb8b1387df5c0ce2ef8fe9f51e5624f0",
".git/objects/16/15990e3c4a5a835b6f2637f16dfea458d20426": "746b08a714c9011a7eac95463e9d1604",
".git/objects/87/f07dddc09e9ab5793d7f18960f777c1bc93457": "b2ed7da618fb5df170a9ecf520260cbd",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/19/49491fe9516a8989f036896a3e154583671459": "c597fc5e3d4267aa11ceba8cade49846",
".git/objects/75/7e2e61ba2b24b94e30a2490103a4eb09c60ff5": "c886352518f96786dff2e89754449a45",
".git/objects/44/19682da09428c1f7b11ce652c9ae35d66897dd": "ed78259bb9be2c61486983bc0e16eb34",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/31/9041387e797bf8da0b925b28f03d745c499b81": "c5b446bf9586e3881ff36d235e4a5989",
".git/objects/65/eb2235d236b429e876af972ee92f6e7c6f9ecf": "ba497b9b32a965dc15a91a21afd85421",
".git/objects/3f/20e56477270b03de01fe70dadf2b9375d1a1ff": "531627a1b837cbd1291a54088b0e8e91",
".git/objects/08/90e3dc55b2c203d264ab814840a93851310f55": "6a2398d1b2a71854ee9d3a93cf290692",
".git/objects/39/fd671d91bb28183f5c50ce28a2cd9f134436f9": "0f599a6c2a2644d55c3cce3debf809d1",
".git/objects/52/b8f4edcd552daad699bb6c3dd51a16268302ba": "1a59bb6f149e6e4da08e73bee2e69cec",
".git/objects/d2/22ab6d7f18db5b2dd82cf9761abaf39260dfe8": "23e2284ca4726ceee5a4d62f96ddb53b",
".git/objects/aa/2261b38e221d259cd7f58ad6441e8772d564f2": "ace2c8185290e4065040643e4d940824",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/a8/beffd3ad4fe54d6cabccf83a05477d6a986cd0": "6677888e4a051c7838b5b240c09f0981",
".git/objects/b0/cebba62ccb61f4d2baf5ae7d9937ff4dd3465e": "796c10bf127e161286f2ba591c4c98ab",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/ff/6a9c4bf938b3b9b0d54163026e1779367bb4f6": "89215e03df10d16c43da6bf12e207a38",
".git/objects/e9/e575d0b36ebd696294496017834c26b62e1505": "8eca52e53d59927cc7c00a13888ea67b",
".git/objects/79/55588d4eaeb803227ed47335ff68a127e7e82a": "ee8c3d4b44bf94c681244d0d9e85f94b",
".git/objects/2d/cf3542c874e33cd8ab86ceb6f0ec444228aa78": "66baad0ae5d874f09b6eee790095bc65",
".git/objects/41/de173d9014b38f8290acf270c490b37fc79a60": "d2a9d01215e9d65fd0456ded49e98878",
".git/objects/83/d61556692197fbb76d950a32a7cd3e2502ed85": "0c19b558850be17008850d42990c6110",
".git/objects/1e/727aefc44c39e1197960ea9579a496dc469929": "f822872fb8623c94de480b45c918a3e8",
".git/objects/24/b1f14dd348b07c9b8373758bde9ac14d16fd92": "dbf45d6c044044561758a334420e9569",
".git/objects/8c/012917dab71a26d535ff8c614582477a123a6d": "22939eff7a0cb1fc6bb53c9bf363b949",
".git/objects/85/43aeeb592f41f3563b0cb781a8a25acef770cd": "3f16716ae5efcdd63f6208911847e8b2",
".git/objects/76/8651b2e249c2517c7b37bdbeea0a5d8bfbb707": "495b1c4fefa633f6afe4dc5840ebe18f",
".git/objects/2b/5079d855e229afb493babcab244d57c9024879": "0ec75686f209f4af8b172cf51871050e",
".git/HEAD": "4cf2d64e44205fe628ddd534e1151b58",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "1d6ea585f1c648d0292283454716fb4c",
".git/logs/refs/heads/master": "1d6ea585f1c648d0292283454716fb4c",
".git/logs/refs/remotes/heroku/master": "f7ce06887c7c9350586d9a7be7d2341e",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-commit.sample": "305eadbbcd6f6d2567e033ad12aabbc4",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/fsmonitor-watchman.sample": "ea587b0fae70333bce92257152996e70",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/refs/heads/master": "9ecb94017782fa122cf5f4777227ea4d",
".git/refs/remotes/heroku/master": "9ecb94017782fa122cf5f4777227ea4d",
".git/index": "2fd1af4b794f13277397acd6b12dd377",
".git/COMMIT_EDITMSG": "d778d8b1f42d0dd1bb284e5ca9549187",
".git/FETCH_HEAD": "d41d8cd98f00b204e9800998ecf8427e",
"assets/flutter_logo.png": "8ba1d5b022cd7f5999bea3085e87ceb0",
"assets/AssetManifest.json": "d28c888634906fb585a4e78b850824ca",
"assets/NOTICES": "c2d6b3ca06ff20b77dacfc26f0d1e99d",
"assets/FontManifest.json": "6b53bbac7e12ce88331411914c31782e",
"assets/packages/window_manager/images/ic_chrome_unmaximize.png": "4a90c1909cb74e8f0d35794e2f61d8bf",
"assets/packages/window_manager/images/ic_chrome_minimize.png": "4282cd84cb36edf2efb950ad9269ca62",
"assets/packages/window_manager/images/ic_chrome_maximize.png": "af7499d7657c8b69d23b85156b60298c",
"assets/packages/window_manager/images/ic_chrome_close.png": "75f4b8ab3608a05461a31fc18d6b47c2",
"assets/packages/fluent_ui/fonts/FluentIcons.ttf": "1cd173aed13e298ab2663dd0924f6762",
"assets/packages/fluent_ui/assets/AcrylicNoise.png": "81f27726c45346351eca125bd062e9a7",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
