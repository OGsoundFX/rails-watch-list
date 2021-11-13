import $ from 'jquery';
import 'select2';

const initiateSelect2 = () => {
  $('.select').select2({
    width: "100%"
  });
}


export { initiateSelect2 }