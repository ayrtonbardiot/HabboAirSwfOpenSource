// by nota

//_-f1y._SafeStr_1356

package _-f1y
{
    import com.sulake.core.communication.messages.IMessageParser;
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1356 implements IMessageParser 
    {

        private var _SafeStr_4749:Vector.<_SafeStr_1585>;


        public function flush():Boolean
        {
            _SafeStr_4749 = null;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_3:int;
            var _local_4:* = null;
            _SafeStr_4749 = new Vector.<_SafeStr_1585>();
            var _local_2:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _local_4 = new _SafeStr_1585();
                _local_4.code = _arg_1.readString();
                _local_4.errorMessage = _arg_1.readString();
                _local_4.isAllowed = _arg_1.readBoolean();
                _SafeStr_4749.push(_local_4);
                _local_3++;
            };
            return (true);
        }

        public function getPerks():Vector.<_SafeStr_1585>
        {
            return (_SafeStr_4749);
        }

        public function isPerkAllowed(_arg_1:String):Boolean
        {
            var _local_2:_SafeStr_1585 = getPerk(_arg_1);
            return ((!(_local_2 == null)) && (_local_2.isAllowed));
        }

        public function getPerk(_arg_1:String):_SafeStr_1585
        {
            for each (var _local_2:_SafeStr_1585 in _SafeStr_4749)
            {
                if (_local_2.code == _arg_1)
                {
                    return (_local_2);
                };
            };
            return (null);
        }


    }
}//package _-f1y

// _SafeStr_1356 = "_-dY" (String#9242, DoABC#3)
// _SafeStr_1585 = "_-xW" (String#10563, DoABC#3)
// _SafeStr_4749 = "_-b1i" (String#9066, DoABC#3)


