// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_SafeStr_3

package 
{
    import flash.utils.ByteArray;

    public class _SafeStr_3 
    {

        private const _SafeStr_9252:uint = 0x0100;

        private var i:int = 0;
        private var _SafeStr_9250:int = 0;
        private var _SafeStr_9251:ByteArray;

        public function _SafeStr_3(_arg_1:ByteArray=null)
        {
            this._SafeStr_9251 = new ByteArray();
            if (_arg_1)
            {
                this._SafeStr_3526(_arg_1);
            };
        }

        public function _SafeStr_9253():uint
        {
            return (this._SafeStr_9252);
        }

        public function _SafeStr_3526(_arg_1:ByteArray):void
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:int;
            _local_2 = 0;
            while (_local_2 < 0x0100)
            {
                while ((this._SafeStr_9251[_local_2] = _local_2), true)
                {
                    _local_2++;
                    break;
                };
            };
            _local_3 = 0;
            _local_2 = 0;
            _loop_1:
            while (_local_2 < 0x0100)
            {
                _local_3 = (((_local_3 + this._SafeStr_9251[_local_2]) + _arg_1[(_local_2 % _arg_1.length)]) & 0xFF);
                    
                outer_block:
                {

                    while ((_local_4 = this._SafeStr_9251[_local_2]), break outer_block, (this._SafeStr_9251[_local_3] = _local_4), true)
                    {
                        _local_2++;
                        continue _loop_1;
                    };
                
                }//outer_block
                this._SafeStr_9251[_local_2] = this._SafeStr_9251[_local_3];
                //unresolved jump
            };
            this.i = 0;
            this._SafeStr_9250 = 0;
        }

        private function _SafeStr_9254():uint
        {
            var _local_1:int;
            this.i = ((this.i + 1) & 0xFF);
            while ((this._SafeStr_9250 = ((this._SafeStr_9250 + this._SafeStr_9251[this.i]) & 0xFF)), (_local_1 = this._SafeStr_9251[this.i]), true)
            {
                this._SafeStr_9251[this.i] = this._SafeStr_9251[this._SafeStr_9250];
                this._SafeStr_9251[this._SafeStr_9250] = _local_1;
                break;
            };
            return (this._SafeStr_9251[((_local_1 + this._SafeStr_9251[this.i]) & 0xFF)]);
        }

        public function _SafeStr_9255():uint
        {
            return (1);
        }

        public function _SafeStr_3527(_arg_1:ByteArray):void
        {
            var _local_2:uint;
            while (_local_2 < _arg_1.length)
            {
                var _local_3:* = _local_2++;
                _arg_1[_local_3] = (_arg_1[_local_3] ^ this._SafeStr_9254());
            };
        }

        public function _SafeStr_3525(_arg_1:ByteArray):void
        {
            this._SafeStr_3527(_arg_1);
        }

        public function _SafeStr_9256():void
        {
            var _local_1:uint;
            if (this._SafeStr_9251 != null)
            {
                _local_1 = 0;
                while (_local_1 < this._SafeStr_9251.length)
                {
                    while ((this._SafeStr_9251[_local_1] = (Math.random() * 0x0100)), true)
                    {
                        _local_1++;
                        break;
                    };
                };
                this._SafeStr_9251.length = 0;
                this._SafeStr_9251 = null;
            };
            this.i = 0;
            this._SafeStr_9250 = 0;
        }


    }
}//package 

// _SafeStr_3 = "_o_-__" (String#3, DoABC#1)
// _SafeStr_3525 = "_o_-___-" (String#21, DoABC#1)
// _SafeStr_3526 = "_o_-_-" (String#46, DoABC#1)
// _SafeStr_3527 = "_o_-____" (String#36, DoABC#1)
// _SafeStr_9250 = "_o_-___" (String#15, DoABC#1)
// _SafeStr_9251 = "_o_-__-" (String#6, DoABC#1)
// _SafeStr_9252 = "_o_-" (String#42, DoABC#1)
// _SafeStr_9253 = "_o_-_" (String#48, DoABC#1)
// _SafeStr_9254 = "_o_--__" (String#32, DoABC#1)
// _SafeStr_9255 = "_o_-__-_" (String#60, DoABC#1)
// _SafeStr_9256 = "_o_---" (String#77, DoABC#1)


