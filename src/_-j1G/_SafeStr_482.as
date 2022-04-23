// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-j1G._SafeStr_482

package _-j1G
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_482 implements IMessageComposer 
    {

        private var _SafeStr_4157:int;
        private var _SafeStr_3834:String;
        private var _SafeStr_7270:String;

        public function _SafeStr_482(_arg_1:int, _arg_2:String, _arg_3:String="")
        {
            _SafeStr_4157 = _arg_1;
            _SafeStr_3834 = _arg_2;
            _SafeStr_7270 = _arg_3;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return ([_SafeStr_4157, _SafeStr_3834, _SafeStr_7270]);
        }


    }
}//package _-j1G

// _SafeStr_3834 = "_-tK" (String#10279, DoABC#3)
// _SafeStr_4157 = "_-G8" (String#7620, DoABC#3)
// _SafeStr_482 = "_-L1o" (String#7955, DoABC#3)
// _SafeStr_7270 = "_-A1g" (String#7229, DoABC#3)


