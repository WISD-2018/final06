Vue.component('user-addresses-create-and-edit', {
  data() {
    return {
      nationality: '',
      city: '',
      district: '',
    }
  },
  methods: {
    onDistrictChanged(val) {
      if(val.length === 3) {
        this.nationality = val[0];
        this.city = val[1];
        this.district = val[2];
      }
    }
  }
});