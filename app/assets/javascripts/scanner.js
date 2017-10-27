

function order_by_occurrence(arr) {
  var counts = {};
  arr.forEach(function(value){
      if(!counts[value]) {
          counts[value] = 0;
      }
      counts[value]++;
  });

  return Object.keys(counts).sort(function(curKey,nextKey) {
      return counts[curKey] < counts[nextKey];
  });
}

if ($('#barcode-scanner').length > 0 && navigator.mediaDevices && typeof navigator.mediaDevices.getUserMedia === 'function') {
  // console.log(1);
  var last_result = [];
  if (Quagga.initialized == undefined) {
    // console.log(2);
    Quagga.onDetected(function(result) {
      // console.log(3);
      var last_code = result.codeResult.code;
      last_result.push(last_code);
      if (last_result.length > 20) {
        code = order_by_occurrence(last_result)[0];
        // console.log(last_result);
        last_result = [];
        Quagga.stop();

        $.ajax({
          type: "POST",
          url: '/nihonshus/get_barcode',
          data: { sku: code },
          headers: { 'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')}
        }).then( function(data) {
          // console.log(data);
          window.open(data.target_url,"_self");
        });
      }
    });
  }

  Quagga.init({
    inputStream : {
      name : "Live",
      type : "LiveStream",
      numOfWorkers: navigator.hardwareConcurrency,
      target: document.querySelector('#barcode-scanner')
    },
    decoder: {
        readers : ['ean_reader','ean_8_reader','code_39_reader','code_39_vin_reader','codabar_reader','upc_reader','upc_e_reader']
    }
  },function(err) {
      if (err) { console.log(err); return }
      Quagga.initialized = true;
      Quagga.start();
  });

}
