// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-41O._SafeStr_1567

package _-41O
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1567 implements _SafeStr_13 
    {

        private var _SafeStr_4259:String;
        private var _SafeStr_7068:Array = [];

        public function _SafeStr_1567(_arg_1:IMessageDataWrapper):void
        {
            var _local_3:int;
            super();
            _SafeStr_4259 = _arg_1.readString();
            var _local_2:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _SafeStr_7068.push(new _SafeStr_1666(_arg_1));
                _local_3++;
            };
        }

        public function dispose():void
        {
            _SafeStr_7068 = null;
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_7068 == null);
        }

        public function get hof():Array
        {
            return (_SafeStr_7068);
        }

        public function get goalCode():String
        {
            return (_SafeStr_4259);
        }


    }
}//package _-41O

// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)
// _SafeStr_1567 = "_-Zx" (String#8953, DoABC#3)
// _SafeStr_1666 = "_-oM" (String#9954, DoABC#3)
// _SafeStr_4259 = "_-Y1y" (String#8856, DoABC#3)
// _SafeStr_7068 = "_-g7" (String#9420, DoABC#3)


