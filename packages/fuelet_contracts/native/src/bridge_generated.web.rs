use super::*;
// Section: wire functions

#[wasm_bindgen]
pub fn wire_hello_from_rust(port_: MessagePort) {
    wire_hello_from_rust_impl(port_)
}

// Section: allocate functions

// Section: related functions

// Section: impl Wire2Api

// Section: impl Wire2Api for JsValue
