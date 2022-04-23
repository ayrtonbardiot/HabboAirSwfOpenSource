// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-q1n._SafeStr_477

package _-q1n
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_477 implements IMessageComposer 
    {

        private var _SafeStr_3740:Array = [];

        public function _SafeStr_477(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:String, _arg_5:Boolean, _arg_6:String, _arg_7:int)
        {
            _SafeStr_3740.push(_arg_1);
            _SafeStr_3740.push(_arg_2);
            _SafeStr_3740.push(_arg_3);
            _SafeStr_3740.push(_arg_4);
            _SafeStr_3740.push(_arg_5);
            _SafeStr_3740.push(_arg_6);
            _SafeStr_3740.push(_arg_7);
        }

        public function getMessageArray():Array
        {
            return (_SafeStr_3740);
        }

        public function dispose():void
        {
        }


    }
}//package _-q1n

// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)
// _SafeStr_477 = "_-eV" (String#9309, DoABC#3)


