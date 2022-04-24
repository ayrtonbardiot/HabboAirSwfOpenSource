// by nota

//_-qv._SafeStr_895

package _-qv
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_895 implements IMessageComposer 
    {

        private var _SafeStr_4158:String;
        private var _SafeStr_4028:String;
        private var _action:String;
        private var _extraString:String;
        private var _SafeStr_6534:int;

        public function _SafeStr_895(_arg_1:String, _arg_2:String, _arg_3:String, _arg_4:String="", _arg_5:int=0)
        {
            _SafeStr_4158 = ((_arg_1) ? _arg_1 : "");
            _SafeStr_4028 = ((_arg_2) ? _arg_2 : "");
            _action = ((_arg_3) ? _arg_3 : "");
            _extraString = ((_arg_4) ? _arg_4 : "");
            _SafeStr_6534 = ((_arg_5) ? _arg_5 : 0);
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return ([_SafeStr_4158, _SafeStr_4028, _action, _extraString, _SafeStr_6534]);
        }


    }
}//package _-qv

// _SafeStr_4028 = "_-81R" (String#7081, DoABC#3)
// _SafeStr_4158 = "_-pH" (String#10006, DoABC#3)
// _SafeStr_6534 = "_-UH" (String#8575, DoABC#3)
// _SafeStr_895 = "_-6o" (String#7000, DoABC#3)


