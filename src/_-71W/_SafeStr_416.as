// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-71W._SafeStr_416

package _-71W
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime._SafeStr_13;

    [SecureSWF(rename="true")]
    public class _SafeStr_416 implements IMessageComposer, _SafeStr_13 
    {

        private var _SafeStr_6600:Array = [];

        public function _SafeStr_416(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:Boolean, _arg_6:int)
        {
            _SafeStr_6600.push(_arg_1);
            _SafeStr_6600.push(_arg_2);
            _SafeStr_6600.push(_arg_3);
            _SafeStr_6600.push(_arg_4);
            _SafeStr_6600.push(_arg_5);
            _SafeStr_6600.push(_arg_6);
        }

        public function getMessageArray():Array
        {
            return (_SafeStr_6600);
        }

        public function dispose():void
        {
            _SafeStr_6600 = null;
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_6600 == null);
        }


    }
}//package _-71W

// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)
// _SafeStr_416 = "_-VN" (String#8639, DoABC#3)
// _SafeStr_6600 = "_-91h" (String#56, DoABC#3)


