use super::*;
// Section: wire functions

#[no_mangle]
pub extern "C" fn wire_new__static_method__TokenContract(
    port_: i64,
    node_url: *mut wire_uint_8_list,
) {
    wire_new__static_method__TokenContract_impl(port_, node_url)
}

#[no_mangle]
pub extern "C" fn wire_total_assets__method__TokenContract(
    port_: i64,
    that: *mut wire_TokenContract,
    contract_id: *mut wire_uint_8_list,
) {
    wire_total_assets__method__TokenContract_impl(port_, that, contract_id)
}

#[no_mangle]
pub extern "C" fn wire_total_supply__method__TokenContract(
    port_: i64,
    that: *mut wire_TokenContract,
    contract_id: *mut wire_uint_8_list,
    asset_id: *mut wire_uint_8_list,
) {
    wire_total_supply__method__TokenContract_impl(port_, that, contract_id, asset_id)
}

#[no_mangle]
pub extern "C" fn wire_name__method__TokenContract(
    port_: i64,
    that: *mut wire_TokenContract,
    contract_id: *mut wire_uint_8_list,
    asset_id: *mut wire_uint_8_list,
) {
    wire_name__method__TokenContract_impl(port_, that, contract_id, asset_id)
}

#[no_mangle]
pub extern "C" fn wire_symbol__method__TokenContract(
    port_: i64,
    that: *mut wire_TokenContract,
    contract_id: *mut wire_uint_8_list,
    asset_id: *mut wire_uint_8_list,
) {
    wire_symbol__method__TokenContract_impl(port_, that, contract_id, asset_id)
}

#[no_mangle]
pub extern "C" fn wire_decimals__method__TokenContract(
    port_: i64,
    that: *mut wire_TokenContract,
    contract_id: *mut wire_uint_8_list,
    asset_id: *mut wire_uint_8_list,
) {
    wire_decimals__method__TokenContract_impl(port_, that, contract_id, asset_id)
}

#[no_mangle]
pub extern "C" fn wire_metadata__method__TokenContract(
    port_: i64,
    that: *mut wire_TokenContract,
    contract_id: *mut wire_uint_8_list,
    asset_id: *mut wire_uint_8_list,
    key: *mut wire_uint_8_list,
) {
    wire_metadata__method__TokenContract_impl(port_, that, contract_id, asset_id, key)
}

// Section: allocate functions

#[no_mangle]
pub extern "C" fn new_box_autoadd_token_contract_0() -> *mut wire_TokenContract {
    support::new_leak_box_ptr(wire_TokenContract::new_with_null_ptr())
}

#[no_mangle]
pub extern "C" fn new_uint_8_list_0(len: i32) -> *mut wire_uint_8_list {
    let ans = wire_uint_8_list {
        ptr: support::new_leak_vec_ptr(Default::default(), len),
        len,
    };
    support::new_leak_box_ptr(ans)
}

// Section: related functions

// Section: impl Wire2Api

impl Wire2Api<String> for *mut wire_uint_8_list {
    fn wire2api(self) -> String {
        let vec: Vec<u8> = self.wire2api();
        String::from_utf8_lossy(&vec).into_owned()
    }
}
impl Wire2Api<TokenContract> for *mut wire_TokenContract {
    fn wire2api(self) -> TokenContract {
        let wrap = unsafe { support::box_from_leak_ptr(self) };
        Wire2Api::<TokenContract>::wire2api(*wrap).into()
    }
}
impl Wire2Api<TokenContract> for wire_TokenContract {
    fn wire2api(self) -> TokenContract {
        TokenContract {
            node_url: self.node_url.wire2api(),
        }
    }
}

impl Wire2Api<Vec<u8>> for *mut wire_uint_8_list {
    fn wire2api(self) -> Vec<u8> {
        unsafe {
            let wrap = support::box_from_leak_ptr(self);
            support::vec_from_leak_ptr(wrap.ptr, wrap.len)
        }
    }
}
// Section: wire structs

#[repr(C)]
#[derive(Clone)]
pub struct wire_TokenContract {
    node_url: *mut wire_uint_8_list,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_uint_8_list {
    ptr: *mut u8,
    len: i32,
}

// Section: impl NewWithNullPtr

pub trait NewWithNullPtr {
    fn new_with_null_ptr() -> Self;
}

impl<T> NewWithNullPtr for *mut T {
    fn new_with_null_ptr() -> Self {
        std::ptr::null_mut()
    }
}

impl NewWithNullPtr for wire_TokenContract {
    fn new_with_null_ptr() -> Self {
        Self {
            node_url: core::ptr::null_mut(),
        }
    }
}

impl Default for wire_TokenContract {
    fn default() -> Self {
        Self::new_with_null_ptr()
    }
}

// Section: sync execution mode utility

#[no_mangle]
pub extern "C" fn free_WireSyncReturn(ptr: support::WireSyncReturn) {
    unsafe {
        let _ = support::box_from_leak_ptr(ptr);
    };
}
