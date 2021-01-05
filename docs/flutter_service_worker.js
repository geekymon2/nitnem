'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/assets/images/floral-left.png": "733237259f25964836fe97a73c419a42",
"assets/assets/images/floral-right.png": "3311b51ac4e270379953c2ffb97c1690",
"assets/assets/images/khanda.png": "c2444a63ef29399977e860ffbf116f43",
"assets/assets/images/book.png": "5d78efd2a9bd350336d58d5a5134931b",
"assets/assets/fonts/Kingthings/Kingthings_Calligraphica_Italic.ttf": "7e762eb6f38e8f7e582d792b79f9d57d",
"assets/assets/fonts/Kingthings/Kingthings_Calligraphica_2.ttf": "a280251f5185af027252aa5fe209caf6",
"assets/assets/fonts/Kingthings/Kingthings_Calligraphica_Light.ttf": "699179087567b1ce9502215f54cf48cb",
"assets/assets/fonts/Gurakhar/GURAKH_L.ttf": "7c9f2bbcac48cc980078a1589e18c67d",
"assets/assets/fonts/Gurakhar/GURAKHAR.ttf": "92ffab686438db440846e5e750778f0f",
"assets/assets/fonts/Gurakhar/GUAK_TH.ttf": "da9c7164351ad42e8232ca5839216e46",
"assets/assets/fonts/Gurbanihindi/Gurbanihindi.ttf": "d82020f194a36aa2facbc0a7183e2501",
"assets/assets/fonts/RobotoSlab/RobotoSlab-Regular.ttf": "4855f0cb5e91e2ef3b96f425545e6650",
"assets/assets/fonts/RobotoSlab/RobotoSlab-Bold.ttf": "13d51441f9cb03fb01671fb81379d212",
"assets/assets/fonts/Sansation/Sansation-Bold.ttf": "37c961d1db011f138962a4c60f356346",
"assets/assets/fonts/Sansation/Sansation-Regular.ttf": "b06ad7b83e55d7b3599a21635ab88644",
"assets/assets/fonts/Sansation/Sansation-Italic.ttf": "816fd44e8b465216b1a3b33fb5700f39",
"assets/assets/fonts/Sansation/Sansation-BoldItalic.ttf": "4e2cc6069f7f1d12ad99cf4b0182d4bc",
"assets/assets/path/ardas_en.txt": "cf9ad03752155c8fb2dec73f79b94c83",
"assets/assets/path/chaupai_sahib_hi.txt": "db13b977877dad2713b17eb05f5af559",
"assets/assets/path/chaupai_sahib_en.txt": "00c1fe105d30207e42eee749e5ee28d1",
"assets/assets/path/ardas_hi.txt": "70d1da6107ca8eda7b67fa274998093d",
"assets/assets/path/sohila_sahib_en.txt": "c9951f8626ab5214bd308c67a6033b1f",
"assets/assets/path/rehraas_sahib_pa.txt": "4c93437da7b24be439d38c66b4818049",
"assets/assets/path/sohila_sahib_hi.txt": "489eb6c7034b92e8a63adf11bbb6d31e",
"assets/assets/path/sohila_sahib_pa.txt": "489eb6c7034b92e8a63adf11bbb6d31e",
"assets/assets/path/tavprasad_savaiye_pa.txt": "a522e55169eabca72bf9c44681b31af8",
"assets/assets/path/jaap_sahib_en.txt": "11b98d6d042abac24813f81b63c7daee",
"assets/assets/path/dukh_bhanjani_sahib_pa.txt": "d1fa532ecf441da592be8fbd262e2584",
"assets/assets/path/anand_sahib_pa.txt": "c509ef73e4b36a00a9ad72d2fa44b435",
"assets/assets/path/japji_sahib_en.txt": "ea5d29002f71a06e8ad377dfb6df0281",
"assets/assets/path/jaap_sahib_pa.txt": "d2e9bb72b3d0a7ed5ed41a24e706bcc2",
"assets/assets/path/chaupai_sahib_pa.txt": "c360069da5565391da45425c5e44747e",
"assets/assets/path/jaap_sahib_hi.txt": "1ee200461214bb37af0c137a7cd7bd4e",
"assets/assets/path/sukhmani_sahib_pa.txt": "5ebfcf491cfce5059fef5a84c1902b3c",
"assets/assets/path/tavprasad_savaiye_en.txt": "a754f0c2bd2a11802da277dad9e1f50a",
"assets/assets/path/anand_sahib_hi.txt": "a5c9b8955d57ee0e4957d708d051053f",
"assets/assets/path/ardas_pa.txt": "ffdff5f726c64867b1b0dc1a32961e67",
"assets/assets/path/japji_sahib_hi.txt": "21cc0a4e0426a5bfd3e9c0b7bac93f05",
"assets/assets/path/rehraas_sahib_en.txt": "8a91ed84f3e436e06ffcdc34b9746ee7",
"assets/assets/path/anand_sahib_en.txt": "f5f1a671de2cd615b557d2e196284c6c",
"assets/assets/path/tavprasad_savaiye_hi.txt": "925c82784414ed5b47d3425c70858456",
"assets/assets/path/dukh_bhanjani_sahib_hi.txt": "d1fa532ecf441da592be8fbd262e2584",
"assets/assets/path/sukhmani_sahib_en.txt": "53dab60808722903798783b696de3fe1",
"assets/assets/path/japji_sahib_pa.txt": "d658194a1199292dc01700bc43a9317d",
"assets/assets/path/rehraas_sahib_hi.txt": "468223da060b210a2c502f68ffdc2355",
"assets/assets/path/sukhmani_sahib_hi.txt": "b6fcb387eb00b5b650d133ba2e70c496",
"assets/assets/path/dukh_bhanjani_sahib_en.txt": "ba2cd416c27765157d16447f0541e34e",
"assets/assets/themes/ThemeName.Stars.jpg": "e1f07077accc611959926ed05a672540",
"assets/assets/themes/ThemeName.Ethnic.jpg": "fcd564762c28894381c6e967cc3cd2bf",
"assets/assets/themes/ThemeName.Default.jpg": "6f3d0a70d4f8a82215dc799a0a8675db",
"assets/assets/themes/ThemeName.Forest.jpg": "7b9a2565f4af7580b4cfec9ca9757935",
"assets/assets/themes/ThemeName.Floral.jpg": "91a0f97feb5558d74aef6e6d398cf43e",
"assets/assets/themes/ThemeName.Wood.jpg": "a54144b433d784935526110675b62677",
"assets/NOTICES": "4de119200e48f2a0f4cf464c83a68a9c",
"assets/FontManifest.json": "f0764cdd0eec83a97c8aab83b160d974",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"assets/fonts/MaterialIcons-Regular.otf": "1288c9e28052e028aba623321f7826ac",
"assets/AssetManifest.json": "3b97c85297a78c23bbab7efe144c9057",
"main.dart.js": "de6760d3237531674fe7f8b247180125",
"index.html": "e93c4293ccff86dd19be0e0c21a6f6b2",
"/": "e93c4293ccff86dd19be0e0c21a6f6b2",
"version.json": "9b65ddac45197573d469ef503f908904"
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
        CORE.map((value) => new Request(value + '?revision=' + RESOURCES[value], {'cache': 'reload'})));
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
  for (var resourceKey in Object.keys(RESOURCES)) {
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
