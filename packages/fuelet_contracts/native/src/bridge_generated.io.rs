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
pub extern "C" fn wire_call_contract__method__TokenContract(
    port_: i64,
    that: *mut wire_TokenContract,
    contract_id: *mut wire_uint_8_list,
) {
    wire_call_contract__method__TokenContract_impl(port_, that, contract_id)
}

// Section: allocate functions

#[no_mangle]
pub extern "C" fn new_WalletUnlocked() -> wire_WalletUnlocked {
    wire_WalletUnlocked::new_with_null_ptr()
}

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

#[no_mangle]
pub extern "C" fn drop_opaque_WalletUnlocked(ptr: *const c_void) {
    unsafe {
        Arc::<WalletUnlocked>::decrement_strong_count(ptr as _);
    }
}

#[no_mangle]
pub extern "C" fn share_opaque_WalletUnlocked(ptr: *const c_void) -> *const c_void {
    unsafe {
        Arc::<WalletUnlocked>::increment_strong_count(ptr as _);
        ptr
    }
}

// Section: impl Wire2Api

impl Wire2Api<String> for *mut wire_uint_8_list {
    fn wire2api(self) -> String {
        let vec: Vec<u8> = self.wire2api();
        String::from_utf8_lossy(&vec).into_owned()
    }
}
impl Wire2Api<RustOpaque<WalletUnlocked>> for wire_WalletUnlocked {
    fn wire2api(self) -> RustOpaque<WalletUnlocked> {
        unsafe { support::opaque_from_dart(self.ptr as _) }
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
            read_wallet: self.read_wallet.wire2api(),
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
pub struct wire_WalletUnlocked {
    ptr: *const core::ffi::c_void,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_TokenContract {
    read_wallet: wire_WalletUnlocked,
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

impl NewWithNullPtr for wire_WalletUnlocked {
    fn new_with_null_ptr() -> Self {
        Self {
            ptr: core::ptr::null(),
        }
    }
}

impl NewWithNullPtr for wire_TokenContract {
    fn new_with_null_ptr() -> Self {
        Self {
            read_wallet: wire_WalletUnlocked::new_with_null_ptr(),
        }
    }
}

// Section: sync execution mode utility

#[no_mangle]
pub extern "C" fn free_WireSyncReturn(ptr: support::WireSyncReturn) {
    unsafe {
        let _ = support::box_from_leak_ptr(ptr);
    };
}
