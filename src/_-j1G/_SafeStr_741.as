// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-j1G._SafeStr_741

package _-j1G
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_741 implements IMessageComposer 
    {

        private var _SafeStr_3740:Array = [];

        public function _SafeStr_741(_arg_1:int, _arg_2:int, _arg_3:String)
        {
            _SafeStr_3740.push(_arg_1);
            _SafeStr_3740.push(_arg_3);
        }

        public function dispose():void
        {
            _SafeStr_3740 = null;
        }

        public function getMessageArray():Array
        {
            return (_SafeStr_3740);
        }


    }
}//package _-j1G

// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)
// _SafeStr_741 = "_-s1o" (String#10200, DoABC#3)


