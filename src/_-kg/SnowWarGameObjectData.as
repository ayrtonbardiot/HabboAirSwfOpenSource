// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-kg.SnowWarGameObjectData

package _-kg
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class SnowWarGameObjectData 
    {

        public static const _SafeStr_7361:int = 1;
        public static const _SafeStr_7362:int = 2;
        public static const _SafeStr_7363:int = 3;
        public static const _SafeStr_7364:int = 4;
        public static const _SafeStr_7365:int = 5;

        protected var _SafeStr_7360:Array = [];

        public function SnowWarGameObjectData(_arg_1:int, _arg_2:int)
        {
            setVariable(0, _arg_1);
            setVariable(1, _arg_2);
        }

        public static function create(_arg_1:int, _arg_2:int):SnowWarGameObjectData
        {
            switch (_arg_1)
            {
                case 1:
                    return (new SnowballGameObjectData(_arg_1, _arg_2));
                case 4:
                    return (new SnowballMachineGameObjectData(_arg_1, _arg_2));
                case 3:
                    return (new SnowballPileGameObjectData(_arg_1, _arg_2));
                case 5:
                    return (new HumanGameObjectData(_arg_1, _arg_2));
                case 2:
                    return (new TreeGameObjectData(_arg_1, _arg_2));
                default:
                    return (null);
            };
        }


        public function get type():int
        {
            return (getVariable(0));
        }

        public function get id():int
        {
            return (getVariable(1));
        }

        public function getVariable(_arg_1:int):int
        {
            return (_SafeStr_7360[_arg_1]);
        }

        protected function setVariable(_arg_1:int, _arg_2:int):void
        {
            _SafeStr_7360[_arg_1] = _arg_2;
        }

        protected function parseVariables(_arg_1:IMessageDataWrapper, _arg_2:int):void
        {
            var _local_3:int;
            _local_3 = 2;
            while (_local_3 < _arg_2)
            {
                _SafeStr_7360.push(_arg_1.readInteger());
                _local_3++;
            };
        }

        public function parse(_arg_1:IMessageDataWrapper):void
        {
        }


    }
}//package _-kg

// _SafeStr_7360 = "_-k1R" (String#9676, DoABC#3)
// _SafeStr_7361 = "_-Z1R" (String#8898, DoABC#3)
// _SafeStr_7362 = "_-b1G" (String#9045, DoABC#3)
// _SafeStr_7363 = "_-e4" (String#9295, DoABC#3)
// _SafeStr_7364 = "_-q0" (String#10029, DoABC#3)
// _SafeStr_7365 = "_-aR" (String#9019, DoABC#3)


