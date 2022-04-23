// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-XO._SafeStr_1029

package _-XO
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_1029 implements IMessageComposer 
    {

        public static const _SafeStr_7783:int = 0;
        public static const _SafeStr_7784:int = 1;
        public static const _SafeStr_7785:int = 2;

        private var _SafeStr_3740:Array = [];

        public function _SafeStr_1029(_arg_1:int, _arg_2:int, _arg_3:String, _arg_4:int)
        {
            _SafeStr_3740.push(_arg_1);
            _SafeStr_3740.push(_arg_2);
            _SafeStr_3740.push(_arg_3);
            _SafeStr_3740.push(_arg_4);
        }

        public function getMessageArray():Array
        {
            return (_SafeStr_3740);
        }

        public function dispose():void
        {
            _SafeStr_3740 = null;
        }


    }
}//package _-XO

// _SafeStr_1029 = "_-r1H" (String#10122, DoABC#3)
// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)
// _SafeStr_7783 = "_-Y1z" (String#8857, DoABC#3)
// _SafeStr_7784 = "_-N0" (String#8047, DoABC#3)
// _SafeStr_7785 = "_-Sd" (String#8453, DoABC#3)


