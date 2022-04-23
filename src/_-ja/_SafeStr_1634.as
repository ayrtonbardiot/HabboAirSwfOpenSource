// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-Ja._SafeStr_1634

package _-Ja
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1634 implements _SafeStr_13, _SafeStr_1556 
    {

        private var _SafeStr_6109:int;
        private var _SafeStr_7316:String;
        private var _rooms:Array = [];
        private var _SafeStr_7317:_SafeStr_1549;
        private var _disposed:Boolean;

        public function _SafeStr_1634(_arg_1:IMessageDataWrapper):void
        {
            var _local_3:int;
            super();
            _SafeStr_6109 = _arg_1.readInteger();
            _SafeStr_7316 = _arg_1.readString();
            var _local_2:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _rooms.push(new _SafeStr_1569(_arg_1));
                _local_3++;
            };
            var _local_4:Boolean = _arg_1.readBoolean();
            if (_local_4)
            {
                _SafeStr_7317 = new _SafeStr_1549(_arg_1);
            };
        }

        public function dispose():void
        {
            if (_disposed)
            {
                return;
            };
            _disposed = true;
            if (this._rooms != null)
            {
                for each (var _local_1:_SafeStr_1569 in this._rooms)
                {
                    _local_1.dispose();
                };
            };
            if (_SafeStr_7317 != null)
            {
                _SafeStr_7317.dispose();
                _SafeStr_7317 = null;
            };
            this._rooms = null;
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function get searchType():int
        {
            return (_SafeStr_6109);
        }

        public function get searchParam():String
        {
            return (_SafeStr_7316);
        }

        public function get rooms():Array
        {
            return (_rooms);
        }

        public function get ad():_SafeStr_1549
        {
            return (_SafeStr_7317);
        }


    }
}//package _-Ja

// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)
// _SafeStr_1549 = "_-jk" (String#9650, DoABC#3)
// _SafeStr_1556 = "_-P1B" (String#8228, DoABC#3)
// _SafeStr_1569 = "_-R1p" (String#8356, DoABC#3)
// _SafeStr_1634 = "_-I1T" (String#7726, DoABC#3)
// _SafeStr_6109 = "_-VG" (String#8636, DoABC#3)
// _SafeStr_7316 = "_-SM" (String#8442, DoABC#3)
// _SafeStr_7317 = "_-e1K" (String#9270, DoABC#3)


