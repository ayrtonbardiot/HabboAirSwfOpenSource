// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_SafeStr_10

package 
{
    import flash.utils.ByteArray;

    public class _SafeStr_10 
    {

        private const _SafeStr_9240:uint = 0x0100;

        private var _SafeStr_9237:int = 0;
        private var _SafeStr_9238:int = 0;
        private var _SafeStr_9239:ByteArray;

        public function _SafeStr_10(_arg_1:ByteArray=null)
        {
            this._SafeStr_9239 = new ByteArray();
            if (_arg_1)
            {
                this._SafeStr_3540(_arg_1);
            };
        }

        public function _SafeStr_9241():uint
        {
            return (this._SafeStr_9240);
        }

        public function _SafeStr_3540(_arg_1:ByteArray):void
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:int;
            _local_2 = 0;
            while (_local_2 < 0x0100)
            {
                while ((this._SafeStr_9239[_local_2] = _local_2), true)
                {
                    _local_2++;
                    break;
                };
            };
            _local_3 = 0;
            _local_2 = 0;
            for (;_local_2 < 0x0100;_local_2++)
            {
                goto _label_3;
                
            _label_1: 
                this._SafeStr_9239[_local_2] = this._SafeStr_9239[_local_3];
                this._SafeStr_9239[_local_3] = _local_4;
                continue;
                
            _label_2: 
                _local_4 = this._SafeStr_9239[_local_2];
                goto _label_1;
                
            _label_3: 
                _local_3 = (((_local_3 + this._SafeStr_9239[_local_2]) + _arg_1[(_local_2 % _arg_1.length)]) & 0xFF);
                goto _label_2;
            };
            this._SafeStr_9237 = 0;
            this._SafeStr_9238 = 0;
        }

        private function _SafeStr_9242():uint
        {
            var _local_1:int;
            this._SafeStr_9237 = ((this._SafeStr_9237 + 1) & 0xFF);
            this._SafeStr_9238 = ((this._SafeStr_9238 + this._SafeStr_9239[this._SafeStr_9237]) & 0xFF);
            while ((_local_1 = this._SafeStr_9239[this._SafeStr_9237]), true)
            {
                this._SafeStr_9239[this._SafeStr_9237] = this._SafeStr_9239[this._SafeStr_9238];
                break;
            };
            this._SafeStr_9239[this._SafeStr_9238] = _local_1;
            return (this._SafeStr_9239[((_local_1 + this._SafeStr_9239[this._SafeStr_9237]) & 0xFF)]);
        }

        public function _SafeStr_9243():uint
        {
            return (1);
        }

        public function _SafeStr_3541(_arg_1:ByteArray):void
        {
            var _local_2:uint;
            while (_local_2 < _arg_1.length)
            {
                var _local_3:* = _local_2++;
                _arg_1[_local_3] = (_arg_1[_local_3] ^ this._SafeStr_9242());
            };
        }

        public function _SafeStr_3536(_arg_1:ByteArray):void
        {
            this._SafeStr_3541(_arg_1);
        }

        public function _SafeStr_9244():void
        {
            var _local_1:uint;
            if (this._SafeStr_9239 != null)
            {
                _local_1 = 0;
                while (_local_1 < this._SafeStr_9239.length)
                {
                    while ((this._SafeStr_9239[_local_1] = (Math.random() * 0x0100)), true)
                    {
                        _local_1++;
                        break;
                    };
                };
                this._SafeStr_9239.length = 0;
                goto _label_2;
                
            _label_1: 
                this._SafeStr_9238 = 0;
                return;
                
            _label_2: 
                this._SafeStr_9239 = null;
            };
            this._SafeStr_9237 = 0;
            goto _label_1;
        }


    }
}//package 

// _SafeStr_10 = "_a_-_-_" (String#3, DoABC#2)
// _SafeStr_3536 = "_a_---_" (String#43, DoABC#2)
// _SafeStr_3540 = "_a_-" (String#42, DoABC#2)
// _SafeStr_3541 = "_a_-_--_" (String#45, DoABC#2)
// _SafeStr_9237 = "_a_-___" (String#13, DoABC#2)
// _SafeStr_9238 = "_a_---__" (String#15, DoABC#2)
// _SafeStr_9239 = "_a_-_-_-" (String#8, DoABC#2)
// _SafeStr_9240 = "_a_-__--" (String#57, DoABC#2)
// _SafeStr_9241 = "_a_--___" (String#71, DoABC#2)
// _SafeStr_9242 = "_a_-__-" (String#56, DoABC#2)
// _SafeStr_9243 = "_a_--_-_" (String#65, DoABC#2)
// _SafeStr_9244 = "_a_-_-" (String#73, DoABC#2)


