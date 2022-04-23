// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.hurlant.crypto.prng.Random

package com.hurlant.crypto.prng
{
    import flash.utils.ByteArray;
    import flash.system.System;
    import flash.system.Capabilities;
    import flash.utils.getTimer;
    import flash.text.Font;
    import com.hurlant.util._SafeStr_1295;

    public class Random 
    {

        private var state:IPRNG;
        private var ready:Boolean = false;
        private var _SafeStr_7978:ByteArray;
        private var _SafeStr_7977:int;
        private var _SafeStr_7979:int;
        private var seeded:Boolean = false;

        public function Random(_arg_1:Class=null)
        {
            var _local_2:uint;
            super();
            if (_arg_1 == null)
            {
                _arg_1 = ARC4;
            };
            state = (new (_arg_1)() as IPRNG);
            _SafeStr_7977 = state.getPoolSize();
            _SafeStr_7978 = new ByteArray();
            _SafeStr_7979 = 0;
            while (_SafeStr_7979 < _SafeStr_7977)
            {
                _local_2 = uint((0x10000 * Math.random()));
                _SafeStr_7978[_SafeStr_7979++] = (_local_2 >>> 8);
                _SafeStr_7978[_SafeStr_7979++] = (_local_2 & 0xFF);
            };
            _SafeStr_7979 = 0;
            seed();
        }

        public function seed(_arg_1:int=0):void
        {
            if (_arg_1 == 0)
            {
                _arg_1 = new Date().getTime();
            };
            var _local_2:* = _SafeStr_7979++;
            var _local_3:* = (_SafeStr_7978[_local_2] ^ (_arg_1 & 0xFF));
            _SafeStr_7978[_local_2] = _local_3;
            _local_3 = _SafeStr_7979++;
            _local_2 = (_SafeStr_7978[_local_3] ^ ((_arg_1 >> 8) & 0xFF));
            _SafeStr_7978[_local_3] = _local_2;
            _local_2 = _SafeStr_7979++;
            _local_3 = (_SafeStr_7978[_local_2] ^ ((_arg_1 >> 16) & 0xFF));
            _SafeStr_7978[_local_2] = _local_3;
            _local_3 = _SafeStr_7979++;
            _local_2 = (_SafeStr_7978[_local_3] ^ ((_arg_1 >> 24) & 0xFF));
            _SafeStr_7978[_local_3] = _local_2;
            _SafeStr_7979 = (_SafeStr_7979 % _SafeStr_7977);
            seeded = true;
        }

        public function autoSeed():void
        {
            var _local_2:ByteArray = new ByteArray();
            _local_2.writeUnsignedInt(System.totalMemory);
            _local_2.writeUTF(Capabilities.serverString);
            _local_2.writeUnsignedInt(getTimer());
            _local_2.writeUnsignedInt(new Date().getTime());
            var _local_1:Array = Font.enumerateFonts(true);
            for each (var _local_3:Font in _local_1)
            {
                _local_2.writeUTF(_local_3.fontName);
                _local_2.writeUTF(_local_3.fontStyle);
                _local_2.writeUTF(_local_3.fontType);
            };
            _local_2.position = 0;
            while (_local_2.bytesAvailable >= 4)
            {
                seed(_local_2.readUnsignedInt());
            };
        }

        public function nextBytes(_arg_1:ByteArray, _arg_2:int):void
        {
            while (_arg_2--)
            {
                _arg_1.writeByte(nextByte());
            };
        }

        public function nextByte():int
        {
            if (!ready)
            {
                if (!seeded)
                {
                    autoSeed();
                };
                state.init(_SafeStr_7978);
                _SafeStr_7978.length = 0;
                _SafeStr_7979 = 0;
                ready = true;
            };
            return (state.next());
        }

        public function dispose():void
        {
            var _local_1:uint;
            _local_1 = 0;
            while (_local_1 < _SafeStr_7978.length)
            {
                _SafeStr_7978[_local_1] = (Math.random() * 0x0100);
                _local_1++;
            };
            _SafeStr_7978.length = 0;
            _SafeStr_7978 = null;
            state.dispose();
            state = null;
            _SafeStr_7977 = 0;
            _SafeStr_7979 = 0;
            _SafeStr_1295.gc();
        }

        public function toString():String
        {
            return ("random-" + state.toString());
        }


    }
}//package com.hurlant.crypto.prng

// _SafeStr_1295 = "_-aw" (String#9033, DoABC#3)
// _SafeStr_7977 = "_-9x" (String#7206, DoABC#3)
// _SafeStr_7978 = "_-7d" (String#7053, DoABC#3)
// _SafeStr_7979 = "_-mY" (String#9833, DoABC#3)


