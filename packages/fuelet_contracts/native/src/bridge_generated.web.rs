use super::*;
// Section: wire functions

#[wasm_bindgen]
pub fn wire_new__static_method__TokenContract(port_: MessagePort, node_url: String) {
    wire_new__static_method__TokenContract_impl(port_, node_url)
}

#[wasm_bindgen]
pub fn wire_config__method__TokenContract(port_: MessagePort, that: JsValue, contract_id: String) {
    wire_config__method__TokenContract_impl(port_, that, contract_id)
}

// Section: allocate functions

// Section: related functions

#[wasm_bindgen]
pub fn drop_opaque_WalletUnlocked(ptr: *const c_void) {
    unsafe {
        Arc::<WalletUnlocked>::decrement_strong_count(ptr as _);
    }
}

#[wasm_bindgen]
pub fn share_opaque_WalletUnlocked(ptr: *const c_void) -> *const c_void {
    unsafe {
        Arc::<WalletUnlocked>::increment_strong_count(ptr as _);
        ptr
    }
}

// Section: impl Wire2Api

impl Wire2Api<String> for String {
    fn wire2api(self) -> String {
        self
    }
}

impl Wire2Api<TokenContract> for JsValue {
    fn wire2api(self) -> TokenContract {
        let self_ = self.dyn_into::<JsArray>().unwrap();
        assert_eq!(
            self_.length(),
            1,
            "Expected 1 elements, got {}",
            self_.length()
        );
        TokenContract {
            read_wallet: self_.get(0).wire2api(),
        }
    }
}

impl Wire2Api<Vec<u8>> for Box<[u8]> {
    fn wire2api(self) -> Vec<u8> {
        self.into_vec()
    }
}
// Section: impl Wire2Api for JsValue

impl Wire2Api<String> for JsValue {
    fn wire2api(self) -> String {
        self.as_string().expect("non-UTF-8 string, or not a string")
    }
}
impl Wire2Api<RustOpaque<WalletUnlocked>> for JsValue {
    fn wire2api(self) -> RustOpaque<WalletUnlocked> {
        #[cfg(target_pointer_width = "64")]
        {
            compile_error!("64-bit pointers are not supported.");
        }

        unsafe { support::opaque_from_dart((self.as_f64().unwrap() as usize) as _) }
    }
}
impl Wire2Api<u8> for JsValue {
    fn wire2api(self) -> u8 {
        self.unchecked_into_f64() as _
    }
}
impl Wire2Api<Vec<u8>> for JsValue {
    fn wire2api(self) -> Vec<u8> {
        self.unchecked_into::<js_sys::Uint8Array>().to_vec().into()
    }
}
