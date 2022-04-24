// by nota

//_-Ja._SafeStr_1676

package _-Ja
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1676 implements _SafeStr_13 
    {

        private var _SafeStr_7321:int;
        private var _SafeStr_7322:int;
        private var _SafeStr_4621:Array = [];
        private var _disposed:Boolean;

        public function _SafeStr_1676(_arg_1:IMessageDataWrapper)
        {
            var _local_4:int;
            var _local_3:* = null;
            super();
            if (_arg_1 == null)
            {
                return;
            };
            _SafeStr_7321 = _arg_1.readInteger();
            _SafeStr_7322 = _arg_1.readInteger();
            var _local_2:int = _arg_1.readInteger();
            _local_4 = 0;
            while (_local_4 < _local_2)
            {
                _local_3 = new _SafeStr_1684();
                _local_3.pos = _arg_1.readInteger();
                _local_3.imgId = _arg_1.readInteger();
                _SafeStr_4621.push(_local_3);
                _local_4++;
            };
            if (_SafeStr_7321 == 0)
            {
                setDefaults();
            };
        }

        public function setDefaults():void
        {
            _SafeStr_7321 = 1;
            _SafeStr_7322 = 0;
            var _local_1:_SafeStr_1684 = new _SafeStr_1684();
            _local_1.pos = 4;
            _local_1.imgId = 1;
            _SafeStr_4621.push(_local_1);
        }

        public function getCopy():_SafeStr_1676
        {
            var _local_1:_SafeStr_1676 = new _SafeStr_1676(null);
            _local_1._SafeStr_7321 = this._SafeStr_7321;
            _local_1._SafeStr_7322 = this._SafeStr_7322;
            for each (var _local_2:_SafeStr_1684 in _SafeStr_4621)
            {
                _local_1._SafeStr_4621.push(_local_2.getCopy());
            };
            return (_local_1);
        }

        public function dispose():void
        {
            if (_disposed)
            {
                return;
            };
            _disposed = true;
            this._SafeStr_4621 = null;
        }

        public function getAsString():String
        {
            var _local_1:String = (_SafeStr_7322 + ";");
            _local_1 = (_local_1 + (_SafeStr_7321 + ";"));
            for each (var _local_2:_SafeStr_1684 in _SafeStr_4621)
            {
                _local_1 = (_local_1 + (((_local_2.imgId + ",") + _local_2.pos) + ";"));
            };
            return (_local_1);
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function get bgImgId():int
        {
            return (_SafeStr_7321);
        }

        public function get frontImgId():int
        {
            return (_SafeStr_7322);
        }

        public function get objects():Array
        {
            return (_SafeStr_4621);
        }

        public function set bgImgId(_arg_1:int):void
        {
            _SafeStr_7321 = _arg_1;
        }

        public function set frontImgId(_arg_1:int):void
        {
            _SafeStr_7322 = _arg_1;
        }


    }
}//package _-Ja

// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)
// _SafeStr_1676 = "_-vy" (String#10433, DoABC#3)
// _SafeStr_1684 = "_-810" (String#7067, DoABC#3)
// _SafeStr_4621 = "_-21w" (String#6655, DoABC#3)
// _SafeStr_7321 = "_-tf" (String#10293, DoABC#3)
// _SafeStr_7322 = "_-U8" (String#8568, DoABC#3)


