// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.friendbar.HabboFriendBar

package com.sulake.habbo.friendbar
{
    import com.sulake.core.runtime._SafeStr_20;
    import com.sulake.habbo.friendbar.data.HabboFriendBarData;
    import com.sulake.iid.IIDHabboFriendBarData;
    import com.sulake.habbo.friendbar.view.HabboFriendBarView;
    import com.sulake.iid.IIDHabboFriendBarView;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.iid.IIDHabboLandingView;
    import com.sulake.habbo.friendbar.talent.HabboTalent;
    import com.sulake.iid.IIDHabboTalent;
    import com.sulake.habbo.friendbar.popup.HabboEpicPopupView;
    import com.sulake.iid.IIDHabboEpicPopupView;
    import com.sulake.habbo.friendbar.groupforums.GroupForumController;
    import com.sulake.iid.IIDHabboGroupForumController;
    import com.sulake.core.runtime._SafeStr_31;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.habbo.friendbar.view._SafeStr_3185;

    public class HabboFriendBar extends _SafeStr_20 implements IHabboFriendBar 
    {

        public function HabboFriendBar(_arg_1:_SafeStr_31, _arg_2:uint=0, _arg_3:_SafeStr_21=null)
        {
            super(_arg_1, _arg_2, _arg_3);
            _arg_1.attachComponent(new HabboFriendBarData(_arg_1, 0, _arg_3), [new IIDHabboFriendBarData()]);
            _arg_1.attachComponent(new HabboFriendBarView(_arg_1, 0, _arg_3), [new IIDHabboFriendBarView()]);
            _arg_1.attachComponent(new HabboLandingView(_arg_1, 0, _arg_3), [new IIDHabboLandingView()]);
            _arg_1.attachComponent(new HabboTalent(_arg_1, 0, _arg_3), [new IIDHabboTalent()]);
            _arg_1.attachComponent(new HabboEpicPopupView(_arg_1, 0, _arg_3), [new IIDHabboEpicPopupView()]);
            _arg_1.attachComponent(new GroupForumController(_arg_1, 0, _arg_3), [new IIDHabboGroupForumController()]);
        }

        public function set visible(_arg_1:Boolean):void
        {
            var _local_2:_SafeStr_3185 = (queueInterface(new IIDHabboFriendBarView()) as _SafeStr_3185);
            if (_local_2 != null)
            {
                _local_2.visible = _arg_1;
                _local_2.release(new IIDHabboFriendBarView());
            };
        }


    }
}//package com.sulake.habbo.friendbar

// _SafeStr_20 = "_-W1o" (String#542, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_31 = "_-Ee" (String#1238, DoABC#4)
// _SafeStr_3185 = "_-jn" (String#5721, DoABC#4)


