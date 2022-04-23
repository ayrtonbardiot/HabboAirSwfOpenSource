// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-o1x._SafeStr_1363

package _-o1x
{
    [SecureSWF(rename="true")]
    public class _SafeStr_1363 
    {

        private var _SafeStr_3693:int;
        private var _name:String;
        private var _description:String;
        private var _SafeStr_5023:int;
        private var _SafeStr_3951:String;
        private var _SafeStr_4674:int;
        private var _SafeStr_7398:int;
        private var _SafeStr_4429:Array;
        private var _SafeStr_7459:Array;
        private var _SafeStr_5022:int;
        private var _SafeStr_7295:Boolean;
        private var _SafeStr_7400:Boolean;
        private var _SafeStr_7401:Boolean;
        private var _SafeStr_7460:Boolean;
        private var _hideWalls:Boolean;
        private var _wallThickness:int;
        private var _floorThickness:int;
        private var _SafeStr_7413:int;
        private var _SafeStr_7414:int;
        private var _SafeStr_7415:int;
        private var _SafeStr_7461:int;
        private var _SafeStr_7462:int;
        private var _SafeStr_7463:int;
        private var _SafeStr_7464:int;
        private var _SafeStr_7465:int;


        public function get tradeMode():int
        {
            return (_SafeStr_5022);
        }

        public function set tradeMode(_arg_1:int):void
        {
            _SafeStr_5022 = _arg_1;
        }

        public function get allowPets():Boolean
        {
            return (_SafeStr_7295);
        }

        public function set allowPets(_arg_1:Boolean):void
        {
            _SafeStr_7295 = _arg_1;
        }

        public function get allowFoodConsume():Boolean
        {
            return (_SafeStr_7400);
        }

        public function set allowFoodConsume(_arg_1:Boolean):void
        {
            _SafeStr_7400 = _arg_1;
        }

        public function get allowWalkThrough():Boolean
        {
            return (_SafeStr_7401);
        }

        public function set allowWalkThrough(_arg_1:Boolean):void
        {
            _SafeStr_7401 = _arg_1;
        }

        public function get hideWalls():Boolean
        {
            return (_hideWalls);
        }

        public function set hideWalls(_arg_1:Boolean):void
        {
            _hideWalls = _arg_1;
        }

        public function get wallThickness():int
        {
            return (_wallThickness);
        }

        public function set wallThickness(_arg_1:int):void
        {
            _wallThickness = _arg_1;
        }

        public function get floorThickness():int
        {
            return (_floorThickness);
        }

        public function set floorThickness(_arg_1:int):void
        {
            _floorThickness = _arg_1;
        }

        public function get roomId():int
        {
            return (_SafeStr_3693);
        }

        public function set roomId(_arg_1:int):void
        {
            _SafeStr_3693 = _arg_1;
        }

        public function get name():String
        {
            return (_name);
        }

        public function set name(_arg_1:String):void
        {
            _name = _arg_1;
        }

        public function get description():String
        {
            return (_description);
        }

        public function set description(_arg_1:String):void
        {
            _description = _arg_1;
        }

        public function get doorMode():int
        {
            return (_SafeStr_5023);
        }

        public function set doorMode(_arg_1:int):void
        {
            _SafeStr_5023 = _arg_1;
        }

        public function get password():String
        {
            return (_SafeStr_3951);
        }

        public function set password(_arg_1:String):void
        {
            _SafeStr_3951 = _arg_1;
        }

        public function get categoryId():int
        {
            return (_SafeStr_4674);
        }

        public function set categoryId(_arg_1:int):void
        {
            _SafeStr_4674 = _arg_1;
        }

        public function get maximumVisitors():int
        {
            return (_SafeStr_7398);
        }

        public function set maximumVisitors(_arg_1:int):void
        {
            _SafeStr_7398 = _arg_1;
        }

        public function get tags():Array
        {
            return (_SafeStr_4429);
        }

        public function set tags(_arg_1:Array):void
        {
            _SafeStr_4429 = _arg_1;
        }

        public function get controllers():Array
        {
            return (_SafeStr_7459);
        }

        public function set controllers(_arg_1:Array):void
        {
            _SafeStr_7459 = _arg_1;
        }

        public function get whoCanMute():int
        {
            return (_SafeStr_7413);
        }

        public function set whoCanMute(_arg_1:int):void
        {
            _SafeStr_7413 = _arg_1;
        }

        public function get whoCanKick():int
        {
            return (_SafeStr_7414);
        }

        public function set whoCanKick(_arg_1:int):void
        {
            _SafeStr_7414 = _arg_1;
        }

        public function get whoCanBan():int
        {
            return (_SafeStr_7415);
        }

        public function set whoCanBan(_arg_1:int):void
        {
            _SafeStr_7415 = _arg_1;
        }

        public function get chatMode():int
        {
            return (_SafeStr_7461);
        }

        public function set chatMode(_arg_1:int):void
        {
            _SafeStr_7461 = _arg_1;
        }

        public function get chatBubbleSize():int
        {
            return (_SafeStr_7462);
        }

        public function set chatBubbleSize(_arg_1:int):void
        {
            _SafeStr_7462 = _arg_1;
        }

        public function get chatScrollUpFrequency():int
        {
            return (_SafeStr_7463);
        }

        public function set chatScrollUpFrequency(_arg_1:int):void
        {
            _SafeStr_7463 = _arg_1;
        }

        public function get chatFullHearRange():int
        {
            return (_SafeStr_7464);
        }

        public function set chatFullHearRange(_arg_1:int):void
        {
            _SafeStr_7464 = _arg_1;
        }

        public function get chatFloodSensitivity():int
        {
            return (_SafeStr_7465);
        }

        public function set chatFloodSensitivity(_arg_1:int):void
        {
            _SafeStr_7465 = _arg_1;
        }

        public function get allowNavigatorDynCats():Boolean
        {
            return (_SafeStr_7460);
        }

        public function set allowNavigatorDynCats(_arg_1:Boolean):void
        {
            _SafeStr_7460 = _arg_1;
        }


    }
}//package _-o1x

// _SafeStr_1363 = "_-ci" (String#9154, DoABC#3)
// _SafeStr_3693 = "_-KI" (String#7909, DoABC#3)
// _SafeStr_3951 = "_-d1A" (String#9173, DoABC#3)
// _SafeStr_4429 = "_-91w" (String#7179, DoABC#3)
// _SafeStr_4674 = "_-k10" (String#9658, DoABC#3)
// _SafeStr_5022 = "_-r8" (String#10148, DoABC#3)
// _SafeStr_5023 = "_-3h" (String#6786, DoABC#3)
// _SafeStr_7295 = "_-TQ" (String#8516, DoABC#3)
// _SafeStr_7398 = "_-DJ" (String#7446, DoABC#3)
// _SafeStr_7400 = "_-B1d" (String#7312, DoABC#3)
// _SafeStr_7401 = "_-h1Y" (String#9472, DoABC#3)
// _SafeStr_7413 = "_-XF" (String#8799, DoABC#3)
// _SafeStr_7414 = "_-H12" (String#7657, DoABC#3)
// _SafeStr_7415 = "_-re" (String#10163, DoABC#3)
// _SafeStr_7459 = "_-e18" (String#9266, DoABC#3)
// _SafeStr_7460 = "_-F1j" (String#7551, DoABC#3)
// _SafeStr_7461 = "_-Sm" (String#8458, DoABC#3)
// _SafeStr_7462 = "_-G1Q" (String#7595, DoABC#3)
// _SafeStr_7463 = "_-dI" (String#9236, DoABC#3)
// _SafeStr_7464 = "_-q4" (String#10070, DoABC#3)
// _SafeStr_7465 = "_-Nd" (String#8103, DoABC#3)


