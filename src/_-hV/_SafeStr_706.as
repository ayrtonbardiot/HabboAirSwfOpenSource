// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-hV._SafeStr_706

package _-hV
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_706 implements IMessageComposer 
    {

        public static const _SafeStr_7259:int = 0;
        public static const _SafeStr_7260:int = 1;
        public static const _SafeStr_7261:int = 2;
        public static const _SafeStr_7262:int = 3;

        private var _SafeStr_3740:Array = [];

        public function _SafeStr_706(_arg_1:String, _arg_2:int)
        {
            _SafeStr_3740.push(_arg_1);
            _SafeStr_3740.push(_arg_2);
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
}//package _-hV

// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)
// _SafeStr_706 = "_-l1O" (String#9745, DoABC#3)
// _SafeStr_7259 = "_-22D" (String#6663, DoABC#3)
// _SafeStr_7260 = "_-G13" (String#7585, DoABC#3)
// _SafeStr_7261 = "_-J6" (String#7793, DoABC#3)
// _SafeStr_7262 = "_-71C" (String#7012, DoABC#3)


