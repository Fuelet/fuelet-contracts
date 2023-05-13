predicate;

const SECRET = 0x2ee0702d32bade831ecf5ebf6707db9452a1be9d508f2fce9d0e4b3b4be751bd;

fn main(secret: b256) -> bool {
    secret == SECRET
}
