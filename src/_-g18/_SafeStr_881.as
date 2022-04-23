// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-g18._SafeStr_881

package _-g18
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import flash.utils.getTimer;

    [SecureSWF(rename="true")]
    public class _SafeStr_881 implements IMessageComposer 
    {

        private var _SafeStr_4132:Array;

        public function _SafeStr_881(_arg_1:String)
        {
            _SafeStr_4132 = [];
            _SafeStr_4132.push(_arg_1);
            _SafeStr_4132.push(getTimer());
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return (_SafeStr_4132);
        }


    }
}//package _-g18

// _SafeStr_4132 = "_-s1S" (String#10186, DoABC#3)
// _SafeStr_881 = "_-w1R" (String#10452, DoABC#3)


