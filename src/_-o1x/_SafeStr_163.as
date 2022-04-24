// by nota

//_-o1x._SafeStr_163

package _-o1x
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime._SafeStr_13;

    [SecureSWF(rename="true")]
    public class _SafeStr_163 implements IMessageComposer, _SafeStr_13 
    {

        public static var _SafeStr_5374:Boolean = true;
        public static var _SafeStr_5376:Boolean = false;

        private var _SafeStr_6600:Array = [];

        public function _SafeStr_163(_arg_1:int, _arg_2:Boolean, _arg_3:String)
        {
            _SafeStr_6600.push(_arg_1);
            _SafeStr_6600.push(_arg_2);
            _SafeStr_6600.push(_arg_3);
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
            return (false);
        }


    }
}//package _-o1x

// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)
// _SafeStr_163 = "_-f1Z" (String#9339, DoABC#3)
// _SafeStr_5374 = "_-o1R" (String#9929, DoABC#3)
// _SafeStr_5376 = "_-01k" (String#6490, DoABC#3)
// _SafeStr_6600 = "_-91h" (String#56, DoABC#3)


