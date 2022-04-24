// by nota

//com.sulake.habbo.session._SafeStr_3273

package com.sulake.habbo.session
{
    public /*dynamic*/ interface _SafeStr_3273 
    {

        function setUserData(_arg_1:_SafeStr_3241):void;
        function getUserData(_arg_1:int):_SafeStr_3241;
        function getUserDataByType(_arg_1:int, _arg_2:int):_SafeStr_3241;
        function getUserDataByIndex(_arg_1:int):_SafeStr_3241;
        function getUserDataByName(_arg_1:String):_SafeStr_3241;
        function getUserBadges(_arg_1:int):Array;
        function removeUserDataByRoomIndex(_arg_1:int):void;
        function setUserBadges(_arg_1:int, _arg_2:Array):void;
        function updateFigure(_arg_1:int, _arg_2:String, _arg_3:String, _arg_4:Boolean, _arg_5:Boolean):void;
        function updatePetLevel(_arg_1:int, _arg_2:int):void;
        function updatePetBreedingStatus(_arg_1:int, _arg_2:Boolean, _arg_3:Boolean, _arg_4:Boolean, _arg_5:Boolean):void;
        function updateCustom(_arg_1:int, _arg_2:String):void;
        function updateAchievementScore(_arg_1:int, _arg_2:int):void;
        function updateNameByIndex(_arg_1:int, _arg_2:String):void;
        function getPetUserData(_arg_1:int):_SafeStr_3241;
        function getRentableBotUserData(_arg_1:int):_SafeStr_3241;
        function requestPetInfo(_arg_1:int):void;
        function getAllUserIds():Array;

    }
}//package com.sulake.habbo.session

// _SafeStr_3241 = "_-O1A" (String#764, DoABC#4)
// _SafeStr_3273 = "_-ut" (String#11180, DoABC#4)


