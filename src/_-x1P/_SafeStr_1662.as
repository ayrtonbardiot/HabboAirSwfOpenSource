// by nota

//_-x1P._SafeStr_1662

package _-x1P
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1662 implements _SafeStr_13 
    {

        private var _SafeStr_7777:Boolean;
        private var _name:String;
        private var _desc:String;
        private var _SafeStr_4429:Array = [];
        private var _disposed:Boolean;

        public function _SafeStr_1662(_arg_1:IMessageDataWrapper)
        {
            var _local_3:int;
            super();
            _SafeStr_7777 = _arg_1.readBoolean();
            if (!exists)
            {
                return;
            };
            _name = _arg_1.readString();
            _desc = _arg_1.readString();
            var _local_2:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _SafeStr_4429.push(_arg_1.readString());
                _local_3++;
            };
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function dispose():void
        {
            if (_disposed)
            {
                return;
            };
            _disposed = true;
            _SafeStr_4429 = null;
        }

        public function get name():String
        {
            return (_name);
        }

        public function get desc():String
        {
            return (_desc);
        }

        public function get tags():Array
        {
            return (_SafeStr_4429);
        }

        public function get exists():Boolean
        {
            return (_SafeStr_7777);
        }


    }
}//package _-x1P

// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)
// _SafeStr_1662 = "_-dD" (String#9232, DoABC#3)
// _SafeStr_4429 = "_-91w" (String#7179, DoABC#3)
// _SafeStr_7777 = "_-f5" (String#9355, DoABC#3)


