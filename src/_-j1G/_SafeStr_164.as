// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-j1G._SafeStr_164

package _-j1G
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_164 implements IMessageComposer 
    {

        private var _SafeStr_4157:int;
        private var _SafeStr_3740:String;
        private var _SafeStr_4653:String;

        public function _SafeStr_164(_arg_1:int, _arg_2:String="", _arg_3:String="")
        {
            _SafeStr_4157 = _arg_1;
            _SafeStr_3740 = _arg_3;
            _SafeStr_4653 = _arg_2;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return ([_SafeStr_4157, _SafeStr_4653, _SafeStr_3740]);
        }


    }
}//package _-j1G

// _SafeStr_164 = "_-xh" (String#10569, DoABC#3)
// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)
// _SafeStr_4157 = "_-G8" (String#7620, DoABC#3)
// _SafeStr_4653 = "_-m10" (String#9790, DoABC#3)


