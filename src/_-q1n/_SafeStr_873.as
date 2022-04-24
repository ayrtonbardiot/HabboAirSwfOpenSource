// by nota

//_-q1n._SafeStr_873

package _-q1n
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_873 implements IMessageComposer 
    {

        private var _SafeStr_3740:Array = [];

        public function _SafeStr_873(_arg_1:int, _arg_2:int, _arg_3:String, _arg_4:String, _arg_5:String, _arg_6:int, _arg_7:int, _arg_8:int, _arg_9:Boolean)
        {
            _SafeStr_3740.push(_arg_1);
            _SafeStr_3740.push(_arg_2);
            _SafeStr_3740.push(_arg_3);
            _SafeStr_3740.push(_arg_4);
            _SafeStr_3740.push(_arg_5);
            _SafeStr_3740.push(_arg_6);
            _SafeStr_3740.push(_arg_7);
            _SafeStr_3740.push(_arg_8);
            _SafeStr_3740.push(_arg_9);
        }

        public function dispose():void
        {
            _SafeStr_3740 = [];
        }

        public function getMessageArray():Array
        {
            return (_SafeStr_3740);
        }


    }
}//package _-q1n

// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)
// _SafeStr_873 = "_-m2" (String#9818, DoABC#3)


