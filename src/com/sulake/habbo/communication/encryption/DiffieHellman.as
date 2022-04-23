// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.communication.encryption.DiffieHellman

package com.sulake.habbo.communication.encryption
{
    import com.sulake.core.communication.handshake._SafeStr_42;
    import com.hurlant.math.BigInteger;

    public class DiffieHellman implements _SafeStr_42 
    {

        private var _privateKey:BigInteger;
        private var _publicKey:BigInteger;
        private var _serverPublicKey:BigInteger;
        private var _sharedKey:BigInteger;
        private var _prime:BigInteger;
        private var _SafeStr_8371:BigInteger;
        private var _minimumPublicKey:BigInteger = BigInteger.nbv(2);
        private var _SafeStr_8372:BigInteger = BigInteger.nbv(2);

        public function DiffieHellman(_arg_1:BigInteger, _arg_2:BigInteger)
        {
            _prime = _arg_1;
            _SafeStr_8371 = _arg_2;
        }

        public function init(_arg_1:String, _arg_2:uint=16):Boolean
        {
            _privateKey = new BigInteger();
            _privateKey.fromRadix(_arg_1, _arg_2);
            _publicKey = _SafeStr_8371.modPow(_privateKey, _prime);
            return (true);
        }

        public function generateSharedKey(_arg_1:String, _arg_2:uint=16):String
        {
            _serverPublicKey = new BigInteger();
            _serverPublicKey.fromRadix(_arg_1, _arg_2);
            _sharedKey = _serverPublicKey.modPow(_privateKey, _prime);
            return (getSharedKey(_arg_2));
        }

        public function getPublicKey(_arg_1:uint=16):String
        {
            return (_publicKey.toRadix(_arg_1));
        }

        public function getSharedKey(_arg_1:uint=16):String
        {
            return (_sharedKey.toRadix(_arg_1));
        }

        public function isValidServerPublicKey():Boolean
        {
            return (_serverPublicKey.compareTo(_minimumPublicKey) >= 0);
        }

        public function isValidSharedKey():Boolean
        {
            return (_sharedKey.compareTo(_SafeStr_8372) >= 0);
        }


    }
}//package com.sulake.habbo.communication.encryption

// _SafeStr_42 = "_-mU" (String#9831, DoABC#3)
// _SafeStr_8371 = "_-cp" (String#9158, DoABC#3)
// _SafeStr_8372 = "_-C1k" (String#7370, DoABC#3)


