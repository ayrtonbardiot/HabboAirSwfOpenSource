// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.communication.encryption.ArcFour

package com.sulake.habbo.communication.encryption
{
    import com.sulake.core.communication.encryption.IEncryption;
    import __AS3__.vec.Vector;
    import flash.utils.ByteArray;

    public class ArcFour implements IEncryption 
    {

        private var i:uint = 0;
        private var j:uint = 0;
        private var sbox:Vector.<uint>;
        private var _SafeStr_8368:uint;
        private var _SafeStr_8369:uint;
        private var _SafeStr_8370:Vector.<uint>;

        public function ArcFour()
        {
            sbox = new Vector.<uint>();
        }

        public function init(_arg_1:ByteArray):void
        {
            var _local_2:uint;
            var _local_3:uint = _arg_1.length;
            i = 0;
            while (i < 0x0100)
            {
                sbox[i] = i;
                i++;
            };
            j = 0;
            i = 0;
            while (i < 0x0100)
            {
                j = (((j + sbox[i]) + _arg_1[(i % _local_3)]) % 0x0100);
                _local_2 = sbox[i];
                sbox[i] = sbox[j];
                sbox[j] = _local_2;
                i++;
            };
            i = 0;
            j = 0;
        }

        public function encipher(_arg_1:ByteArray):void
        {
            var _local_2:uint;
            while (_local_2 < _arg_1.length)
            {
                var _local_3:* = _local_2++;
                var _local_4:* = (_arg_1[_local_3] ^ next());
                _arg_1[_local_3] = _local_4;
            };
        }

        public function decipher(_arg_1:ByteArray):void
        {
            encipher(_arg_1);
        }

        private function next():uint
        {
            i = ((i + 1) & 0xFF);
            j = ((j + sbox[i]) & 0xFF);
            var _local_1:int = sbox[i];
            sbox[i] = sbox[j];
            sbox[j] = _local_1;
            return (sbox[((_local_1 + sbox[i]) & 0xFF)]);
        }

        public function mark():void
        {
            _SafeStr_8368 = i;
            _SafeStr_8369 = j;
            _SafeStr_8370 = sbox.concat();
        }

        public function reset():void
        {
            i = _SafeStr_8368;
            j = _SafeStr_8369;
            sbox = _SafeStr_8370.concat();
        }


    }
}//package com.sulake.habbo.communication.encryption

// _SafeStr_8368 = "_-Dt" (String#7460, DoABC#3)
// _SafeStr_8369 = "_-I1a" (String#7730, DoABC#3)
// _SafeStr_8370 = "_-5A" (String#6906, DoABC#3)


