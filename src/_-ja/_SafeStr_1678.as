// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-Ja._SafeStr_1678

package _-Ja
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1678 implements _SafeStr_13 
    {

        private var _SafeStr_4404:String;
        private var _SafeStr_7323:String;
        private var _SafeStr_7324:_SafeStr_1569;
        private var _rooms:Array = [];
        private var _open:Boolean;
        private var _SafeStr_7325:Boolean;
        private var _disposed:Boolean;

        public function _SafeStr_1678(_arg_1:IMessageDataWrapper)
        {
            var _local_3:int;
            super();
            _SafeStr_4404 = _arg_1.readString();
            _SafeStr_7323 = _arg_1.readString();
            var _local_2:int = _arg_1.readInteger();
            _SafeStr_7324 = new _SafeStr_1569(_arg_1);
            _local_3 = 1;
            while (_local_3 < _local_2)
            {
                _rooms.push(new _SafeStr_1569(_arg_1));
                _local_3++;
            };
        }

        public function dispose():void
        {
            if (_disposed)
            {
                return;
            };
            _disposed = true;
            if (_SafeStr_7324)
            {
                _SafeStr_7324.dispose();
                _SafeStr_7324 = null;
            };
            for each (var _local_1:_SafeStr_1569 in rooms)
            {
                _local_1.dispose();
            };
            _rooms = null;
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function get code():String
        {
            return (_SafeStr_4404);
        }

        public function get leaderFigure():String
        {
            return (_SafeStr_7323);
        }

        public function get rooms():Array
        {
            return (_rooms);
        }

        public function get open():Boolean
        {
            return (_open);
        }

        public function set open(_arg_1:Boolean):void
        {
            _open = _arg_1;
        }

        public function toggleOpen():void
        {
            _open = (!(_open));
        }

        public function get bestRoom():_SafeStr_1569
        {
            return (_SafeStr_7324);
        }

        public function get figurePending():Boolean
        {
            return (_SafeStr_7325);
        }

        public function set figurePending(_arg_1:Boolean):void
        {
            _SafeStr_7325 = _arg_1;
        }


    }
}//package _-Ja

// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)
// _SafeStr_1569 = "_-R1p" (String#8356, DoABC#3)
// _SafeStr_1678 = "_-2l" (String#6702, DoABC#3)
// _SafeStr_4404 = "_-S1r" (String#8423, DoABC#3)
// _SafeStr_7323 = "_-nX" (String#9905, DoABC#3)
// _SafeStr_7324 = "_-YR" (String#8869, DoABC#3)
// _SafeStr_7325 = "_-32M" (String#6747, DoABC#3)


