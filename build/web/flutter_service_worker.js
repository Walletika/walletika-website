'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "3728887eb5a4db480a30ef3f5fb2a48b",
"assets/AssetManifest.json": "a027b809b88faf1e8ef0d13626780c16",
"assets/assets/fonts/Roboto-Black.ttf": "56aa07e4f2f764e31cb09d8ad1362808",
"assets/assets/fonts/Roboto-BlackItalic.ttf": "cb78d8420ac5bc66e3606dd582d5bc08",
"assets/assets/fonts/Roboto-Bold.ttf": "fb6210739c4993c1a86f812e6502e471",
"assets/assets/fonts/Roboto-BoldItalic.ttf": "8fee5306f412b2bd3a5129fe9bba9265",
"assets/assets/fonts/Roboto-Italic.ttf": "9b6488bdc5881a71f018252ae53cc864",
"assets/assets/fonts/Roboto-Light.ttf": "01744b0f7878c20cdcbd7b3a18040d33",
"assets/assets/fonts/Roboto-LightItalic.ttf": "a97f2290ca761625258702295e02d799",
"assets/assets/fonts/Roboto-Medium.ttf": "b21ffa747200921845e38910b8ea97c0",
"assets/assets/fonts/Roboto-MediumItalic.ttf": "2b2e515558cca03d7455ea5039c64c10",
"assets/assets/fonts/Roboto-Regular.ttf": "afe8eacfc0903cc0612dc696881f0480",
"assets/assets/fonts/Roboto-Thin.ttf": "ad0fb8cf3e91768b11388432acb16ca3",
"assets/assets/fonts/Roboto-ThinItalic.ttf": "7c33e4301357ec4164edfc9ff55be6ec",
"assets/assets/illustrations/page_not_found.png": "bdb132bb753a3608b13b80300f5f5808",
"assets/assets/illustrations/search.png": "470ae7d01e1d64dfa14161e4cf923135",
"assets/assets/illustrations/telegram.png": "2948042bc6a950859ef2344e1c63dc2c",
"assets/assets/illustrations/usb.png": "f8d26062a26223a0e48c022f2c99b34c",
"assets/assets/illustrations/wallet.png": "70b4dccf7c3e0ba53c6a9a6248230c57",
"assets/assets/illustrations/wallet_auth.png": "9ac9371b1a8404d2cea059771ccda492",
"assets/assets/illustrations/wallet_auth_dark.png": "2c85b32c0edac1a9f7f4c4be7ac61045",
"assets/assets/illustrations/wallet_dark.png": "71f6c74a6f64efc1cc8260e20f7ff8fe",
"assets/assets/illustrations/wallet_login.png": "f67ed52ce872ebc27aa1cb90fa5948b5",
"assets/assets/illustrations/wallet_login_dark.png": "d9187cf27aab4bf315a80cfc5a4df83a",
"assets/assets/logos/android_apk.png": "607451e98091ce21230a6a8ed1dc10bd",
"assets/assets/logos/app_logo.png": "3f076bda65aaf8e566b579c635f469bf",
"assets/assets/logos/google_store.png": "6b586e5cbc46b92e893d823e18f03449",
"assets/assets/logos/windows_exe.png": "5bb7a71c6882712323fe792b73bd0242",
"assets/assets/logos/windows_store.png": "15b913cbb4c965b193b8a5803ea13847",
"assets/FontManifest.json": "d64fde0ba9eee651055d3fd1c810ecd5",
"assets/fonts/MaterialIcons-Regular.otf": "79f6f766554fddf8b644be46cd613e70",
"assets/NOTICES": "498ce109a6490860ebf1acbaf65377a0",
"assets/packages/line_icons/lib/assets/fonts/LineIcons.ttf": "bcaf3ba974cf7900b3c158ca593f4971",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"canvaskit/canvaskit.js": "76f7d822f42397160c5dfc69cbc9b2de",
"canvaskit/canvaskit.wasm": "f48eaf57cada79163ec6dec7929486ea",
"canvaskit/chromium/canvaskit.js": "8c8392ce4a4364cbb240aa09b5652e05",
"canvaskit/chromium/canvaskit.wasm": "fc18c3010856029414b70cae1afc5cd9",
"canvaskit/skwasm.js": "1df4d741f441fa1a4d10530ced463ef8",
"canvaskit/skwasm.wasm": "6711032e17bf49924b2b001cef0d3ea3",
"canvaskit/skwasm.worker.js": "19659053a277272607529ef87acf9d8a",
"favicon.png": "2fd3451a6ec74307cdce2c9449d3ae90",
"flutter.js": "6b515e434cea20006b3ef1726d2c8894",
"icons/Icon-192.png": "f472405902b99b6ef988383113650d22",
"icons/Icon-512.png": "c08305b8702a246b017ade24412346f2",
"icons/Icon-maskable-192.png": "f472405902b99b6ef988383113650d22",
"icons/Icon-maskable-512.png": "c08305b8702a246b017ade24412346f2",
"index.html": "733b22880dd511c8c48c19ae9e476c57",
"/": "733b22880dd511c8c48c19ae9e476c57",
"main.dart.js": "9ef13165889b6495b90eee277b59d41c",
"manifest.json": "db11d8c0600a877f56a2dbea3988483c",
"version.json": "ec11ce6852a5b68944af8fa4dd467697"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
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
