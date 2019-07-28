## Client Server Model

- It is a request response model.
- Consists of both client and a server.

__Server__: It is an entity that provides services and listens for requests made for those defined services.

__Client__: Entitty requesting services and knows about the available services.

_Note_: Client server communication model is a variant of P2P communication model.

This is a connection oriented model due to the link between the client and the server.

There could be single or multiple servers in the system.

_Example_: Bluetooth

### Client Server Model Communication primitives

- __Request__, __Indication__, __Response__, __Confirmation__
- __Request__ – Invokes a service
- Higher layers in the server receives the request as an Indication
- __Confirmed service__ – if there is a result sent back to the client
- __Unconfirmed service__ – if there is no result sent back to the client

![alt text](./images/client_server_model_comm_primitives.png "Communication Primitives")

- In this model for unconfirmed service additional intelligence is needed to map request with response.
- No confirmation from the underlying protocols on the local application layer.
- There is different layers of reliability built in, one layer confirms reciept to adjacent layer.
- In this model the service needs to be a confirmed one for making any rollback operations.
- Parallel processing is used to cater requests that have strict timeout requirements.
- Hence, multiple processes cater to a client request and confirmation helps stictch different responses together.
    - Ex: Bluetooth and BLE Master slave topology.

- In bluetooth data on the server is organized in the form of attributes.
- The attribute contains 16 bit attribute handle, UUID, permissions and value.
- During a read operation, the client
    - parses the value.
    - UUID is used to understand the datatype of the value.
- During the write operation, the client
    - Provides data that is conformant with the attribute type.
    - Server validates and accepts or rejects the value.
