// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-PB._SafeStr_1299

package _-PB
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1299 implements IMessageParser 
    {

        private var _SafeStr_5536:int;
        private var _SafeStr_5431:int;
        private var _SafeStr_5690:Boolean;
        private var _SafeStr_5820:Boolean;
        private var _SafeStr_5821:Boolean;
        private var _hasBreedingPermission:Boolean;


        public function get roomIndex():int
        {
            return (_SafeStr_5536);
        }

        public function get petId():int
        {
            return (_SafeStr_5431);
        }

        public function get canBreed():Boolean
        {
            return (_SafeStr_5690);
        }

        public function get canHarvest():Boolean
        {
            return (_SafeStr_5820);
        }

        public function get canRevive():Boolean
        {
            return (_SafeStr_5821);
        }

        public function flush():Boolean
        {
            return (true);
        }

        public function get hasBreedingPermission():Boolean
        {
            return (_hasBreedingPermission);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_5536 = _arg_1.readInteger();
            _SafeStr_5431 = _arg_1.readInteger();
            _SafeStr_5690 = _arg_1.readBoolean();
            _SafeStr_5820 = _arg_1.readBoolean();
            _SafeStr_5821 = _arg_1.readBoolean();
            _hasBreedingPermission = _arg_1.readBoolean();
            return (true);
        }


    }
}//package _-PB

// _SafeStr_1299 = "_-N1d" (String#8073, DoABC#3)
// _SafeStr_5431 = "_-GK" (String#7627, DoABC#3)
// _SafeStr_5536 = "_-517" (String#6874, DoABC#3)
// _SafeStr_5690 = "_-e1I" (String#9269, DoABC#3)
// _SafeStr_5820 = "_-m1s" (String#9816, DoABC#3)
// _SafeStr_5821 = "_-j1t" (String#9611, DoABC#3)


