

module.exports = function(RED) {
    function GenEthrAddress(config) {
        RED.nodes.createNode(this,config);
        const Wallet = require('ethereumjs-wallet')

        this.on('input', function(msg) {
            const EthWallet = Wallet.generate();
            var msg_address = {payload : EthWallet.getAddressString()}
            var msg_privateKey = {payload : EthWallet.getPrivateKeyString()}
            this.send([ msg_address , msg_privateKey ]);
        });
    }
    RED.nodes.registerType("gen-ethraddress",GenEthrAddress);
}
