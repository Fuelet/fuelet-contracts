#![allow(
    non_camel_case_types,
    unused,
    clippy::redundant_closure,
    clippy::useless_conversion,
    clippy::unit_arg,
    clippy::double_parens,
    non_snake_case,
    clippy::too_many_arguments
)]
// AUTO GENERATED FILE, DO NOT EDIT.
// Generated by `flutter_rust_bridge`@ 1.57.0.

use crate::api::*;
use core::panic::UnwindSafe;
use flutter_rust_bridge::*;
use std::ffi::c_void;
use std::sync::Arc;

// Section: imports

use crate::model::token_initialize_config::TokenInitializeConfigModel;

// Section: wire functions

fn wire_new__static_method__TokenContract_impl(
    port_: MessagePort,
    node_url: impl Wire2Api<String> + UnwindSafe,
) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap(
        WrapInfo {
            debug_name: "new__static_method__TokenContract",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || {
            let api_node_url = node_url.wire2api();
            move |task_callback| Ok(TokenContract::new(api_node_url))
        },
    )
}
fn wire_config__method__TokenContract_impl(
    port_: MessagePort,
    that: impl Wire2Api<TokenContract> + UnwindSafe,
    contract_id: impl Wire2Api<String> + UnwindSafe,
) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap(
        WrapInfo {
            debug_name: "config__method__TokenContract",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || {
            let api_that = that.wire2api();
            let api_contract_id = contract_id.wire2api();
            move |task_callback| Ok(TokenContract::config(&api_that, api_contract_id))
        },
    )
}
// Section: wrapper structs

// Section: static checks

// Section: allocate functions

// Section: related functions

// Section: impl Wire2Api

pub trait Wire2Api<T> {
    fn wire2api(self) -> T;
}

impl<T, S> Wire2Api<Option<T>> for *mut S
where
    *mut S: Wire2Api<T>,
{
    fn wire2api(self) -> Option<T> {
        (!self.is_null()).then(|| self.wire2api())
    }
}

impl Wire2Api<u8> for u8 {
    fn wire2api(self) -> u8 {
        self
    }
}

// Section: impl IntoDart

impl support::IntoDart for TokenContract {
    fn into_dart(self) -> support::DartAbi {
        vec![self.node_url.into_dart()].into_dart()
    }
}
impl support::IntoDartExceptPrimitive for TokenContract {}

impl support::IntoDart for TokenInitializeConfigModel {
    fn into_dart(self) -> support::DartAbi {
        vec![
            self.name.into_dart(),
            self.symbol.into_dart(),
            self.decimals.into_dart(),
        ]
        .into_dart()
    }
}
impl support::IntoDartExceptPrimitive for TokenInitializeConfigModel {}

// Section: executor

support::lazy_static! {
    pub static ref FLUTTER_RUST_BRIDGE_HANDLER: support::DefaultHandler = Default::default();
}

/// cbindgen:ignore
#[cfg(target_family = "wasm")]
#[path = "bridge_generated.web.rs"]
mod web;
#[cfg(target_family = "wasm")]
pub use web::*;

#[cfg(not(target_family = "wasm"))]
#[path = "bridge_generated.io.rs"]
mod io;
#[cfg(not(target_family = "wasm"))]
pub use io::*;
