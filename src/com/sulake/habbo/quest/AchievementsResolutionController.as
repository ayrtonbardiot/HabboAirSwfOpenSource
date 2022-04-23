// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.quest.AchievementsResolutionController

package com.sulake.habbo.quest
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.window.components._SafeStr_3263;
    import __AS3__.vec.Vector;
    import _-p1o._SafeStr_1617;
    import com.sulake.core.window.components.IItemGridWindow;
    import _-IU._SafeStr_645;
    import _-EK._SafeStr_1575;
    import _-p1o._SafeStr_1618;
    import _-IU._SafeStr_162;
    import com.sulake.habbo.window.utils._SafeStr_3198;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window.components._SafeStr_3199;
    import com.sulake.habbo.window.widgets._SafeStr_3314;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.window.widgets._SafeStr_3349;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;

    public class AchievementsResolutionController implements _SafeStr_13 
    {

        private static const _SafeStr_8701:String = "header_button_close";
        private static const _SafeStr_8703:String = "save_button";
        private static const _SafeStr_8702:String = "cancel_button";
        private static const _SafeStr_8704:String = "ok_button";
        private static const ELEM_DISABLED_INFO:String = "disabled.reason";

        private var _questEngine:HabboQuestEngine;
        private var _window:_SafeStr_3263;
        private var _progressView:AchievementResolutionProgressView;
        private var _completedView:AchievementResolutionCompletedView;
        private var _stuffId:int;
        private var _SafeStr_4403:Vector.<_SafeStr_1617>;
        private var _selectedAchievementId:int = -1;
        private var _endTime:int = -1;

        public function AchievementsResolutionController(_arg_1:HabboQuestEngine)
        {
            _questEngine = _arg_1;
        }

        public function dispose():void
        {
            var _local_1:* = null;
            _questEngine = null;
            if (_window)
            {
                _local_1 = (_window.findChildByName("achievements") as IItemGridWindow);
                if (_local_1)
                {
                    _local_1.destroyGridItems();
                };
                if (_progressView)
                {
                    _progressView.dispose();
                    _progressView = null;
                };
                if (_completedView)
                {
                    _completedView.dispose();
                    _completedView = null;
                };
                _window.dispose();
                _window = null;
            };
        }

        public function get disposed():Boolean
        {
            return (_questEngine == null);
        }

        public function onResolutionAchievements(_arg_1:int, _arg_2:Vector.<_SafeStr_1617>, _arg_3:int):void
        {
            _stuffId = _arg_1;
            _SafeStr_4403 = _arg_2;
            _endTime = _arg_3;
            if (_arg_2.length == 0)
            {
                return;
            };
            refresh();
            _window.visible = true;
            _selectedAchievementId = _SafeStr_4403[0].achievementId;
            populateAchievementGrid();
            selectAchievement(_selectedAchievementId);
        }

        public function onResolutionProgress(_arg_1:int, _arg_2:int, _arg_3:String, _arg_4:int, _arg_5:int, _arg_6:int):void
        {
            if (!_progressView)
            {
                _progressView = new AchievementResolutionProgressView(this);
            };
            _progressView.show(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6);
        }

        public function onResolutionCompleted(_arg_1:String, _arg_2:String):void
        {
            if (!_completedView)
            {
                _completedView = new AchievementResolutionCompletedView(this);
            };
            _completedView.show(_arg_2, _arg_1);
        }

        public function onLevelUp(_arg_1:_SafeStr_1575):void
        {
            if ((((_progressView) && (_progressView.visible)) && (_arg_1.type == _progressView.achievementId)))
            {
                _questEngine.send(new _SafeStr_645(_progressView.stuffId, 0));
            };
        }

        public function onAchievement(_arg_1:_SafeStr_1618):void
        {
            if ((((_progressView) && (_progressView.visible)) && (_arg_1.achievementId == _progressView.achievementId)))
            {
                _questEngine.send(new _SafeStr_645(_progressView.stuffId, 0));
            };
        }

        public function resetResolution(_arg_1:int):void
        {
            var stuffId = _arg_1;
            if ((((_progressView) && (_progressView.visible)) && (stuffId == _progressView.stuffId)))
            {
                var title:String = "${resolution.reset.confirmation.title}";
                var summary:String = "${resolution.reset.confirmation.text}";
                _questEngine.windowManager.confirm(title, summary, 0, function (_arg_1:_SafeStr_3198, _arg_2:_SafeStr_3116):void
                {
                    _arg_1.dispose();
                    if (_arg_2.type == "WE_OK")
                    {
                        _questEngine.send(new _SafeStr_162(stuffId));
                        _questEngine.send(new _SafeStr_645(_progressView.stuffId, 0));
                    };
                });
            };
        }

        private function refresh():void
        {
            if (_window == null)
            {
                prepareWindow();
            };
            var _local_1:_SafeStr_3199 = _SafeStr_3199(_window.findChildByName("countdown_widget"));
            var _local_2:_SafeStr_3314 = _SafeStr_3314(_local_1.widget);
            _local_2.seconds = _endTime;
            _local_2.running = true;
        }

        private function prepareWindow():void
        {
            if (this._window != null)
            {
                return;
            };
            _window = _SafeStr_3263(_questEngine.getXmlWindow("AchievementsResolutions"));
            _window.findChildByTag("close").procedure = onWindowClose;
            _window.center();
            _window.visible = true;
            addClickListener("header_button_close");
            addClickListener("save_button");
            addClickListener("cancel_button");
        }

        private function onWindowClose(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                close();
            };
        }

        private function addClickListener(_arg_1:String):void
        {
            var _local_2:_SafeStr_3109 = _window.findChildByName(_arg_1);
            if (_local_2 != null)
            {
                _local_2.addEventListener("WME_CLICK", onMouseClick);
            };
        }

        private function onMouseClick(_arg_1:WindowMouseEvent):void
        {
            var event = _arg_1;
            switch (event.target.name)
            {
                case "header_button_close":
                case "cancel_button":
                    close();
                    return;
                case "ok_button":
                    return;
                case "save_button":
                    var title:String = "${resolution.confirmation.title}";
                    var summary:String = "${resolution.confirmation.text}";
                    close();
                    _questEngine.windowManager.confirm(title, summary, 0, function (_arg_1:_SafeStr_3198, _arg_2:_SafeStr_3116):void
                    {
                        _arg_1.dispose();
                        if (_arg_2.type == "WE_OK")
                        {
                            _questEngine.send(new _SafeStr_645(_stuffId, _selectedAchievementId));
                        }
                        else
                        {
                            _window.visible = true;
                        };
                    });
                    return;
            };
        }

        public function isVisible():Boolean
        {
            return ((_window) && (_window.visible));
        }

        public function close():void
        {
            if (_window)
            {
                _window.visible = false;
            };
        }

        private function populateAchievementGrid():void
        {
            var _local_3:* = null;
            var _local_2:IItemGridWindow = (_window.findChildByName("achievements") as IItemGridWindow);
            _local_2.destroyGridItems();
            var _local_4:_SafeStr_3109 = _questEngine.getXmlWindow("AchievementSimple");
            for each (var _local_1:_SafeStr_1617 in _SafeStr_4403)
            {
                _local_3 = (_local_4.clone() as _SafeStr_3133);
                _local_3.id = _local_1.achievementId;
                refreshBadgeImage(_local_3, _local_1);
                _local_3.findChildByName("bg_region").procedure = onSelectAchievementProc;
                _local_3.findChildByName("bg_selected_bitmap").visible = false;
                _local_2.addGridItem(_local_3);
            };
        }

        private function hiliteGridItem(_arg_1:int, _arg_2:Boolean):void
        {
            var _local_4:IItemGridWindow = (_window.findChildByName("achievements") as IItemGridWindow);
            var _local_3:_SafeStr_3133 = (_local_4.getGridItemByID(_arg_1) as _SafeStr_3133);
            if (_local_3)
            {
                _local_3.findChildByName("bg_selected_bitmap").visible = _arg_2;
            };
        }

        private function selectAchievement(_arg_1:int):void
        {
            if (_selectedAchievementId != -1)
            {
                hiliteGridItem(_selectedAchievementId, false);
            };
            var _local_2:_SafeStr_1617 = findAchievement(_arg_1);
            if (_local_2 == null)
            {
                return;
            };
            _selectedAchievementId = _arg_1;
            hiliteGridItem(_selectedAchievementId, true);
            _window.findChildByName("achievement.name").caption = _questEngine.localization.getBadgeName(_local_2.badgeId);
            _window.findChildByName("achievement.description").caption = _questEngine.localization.getBadgeDesc(_local_2.badgeId);
            _window.findChildByName("achievement.level").caption = _local_2.level.toString();
            _questEngine.localization.registerParameter("resolution.achievement.target.value", "level", _local_2.requiredLevel.toString());
            refreshBadgeImageLarge(_local_2);
            ((_local_2.enabled) ? enable() : disable(_local_2.state)); //not popped
        }

        private function disable(_arg_1:int):void
        {
            _window.setVisibleChildren(false, ["save_button"]);
            _window.setVisibleChildren(true, ["disabled.reason"]);
            _window.findChildByName("disabled.reason").caption = (("${resolution.disabled." + _arg_1) + "}");
        }

        public function enable():void
        {
            _window.setVisibleChildren(true, ["save_button"]);
            _window.setVisibleChildren(false, ["disabled.reason"]);
        }

        private function onSelectAchievementProc(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            selectAchievement(_arg_2.parent.id);
        }

        private function refreshBadgeImage(_arg_1:_SafeStr_3133, _arg_2:_SafeStr_1617):void
        {
            var _local_4:_SafeStr_3199 = (_arg_1.findChildByName("achievement_pic_bitmap") as _SafeStr_3199);
            var _local_3:_SafeStr_3349 = (_local_4.widget as _SafeStr_3349);
            if (_arg_2 == null)
            {
                _local_4.visible = false;
                return;
            };
            IStaticBitmapWrapperWindow(_SafeStr_3133(_local_4.rootWindow).findChildByName("bitmap")).assetUri = "common_loading_icon";
            _local_3.badgeId = _arg_2.badgeId;
            _local_3.greyscale = (!(_arg_2.enabled));
            _local_4.visible = true;
        }

        private function refreshBadgeImageLarge(_arg_1:_SafeStr_1617):void
        {
            var _local_3:_SafeStr_3199 = (_window.findChildByName("achievement_badge") as _SafeStr_3199);
            var _local_2:_SafeStr_3349 = (_local_3.widget as _SafeStr_3349);
            IStaticBitmapWrapperWindow(_SafeStr_3133(_local_3.rootWindow).findChildByName("bitmap")).assetUri = "common_loading_icon";
            _local_2.badgeId = _arg_1.badgeId;
            _local_2.greyscale = (!(_arg_1.enabled));
            _local_3.visible = true;
        }

        private function findAchievement(_arg_1:int):_SafeStr_1617
        {
            for each (var _local_2:_SafeStr_1617 in _SafeStr_4403)
            {
                if (_local_2.achievementId == _arg_1)
                {
                    return (_local_2);
                };
            };
            return (null);
        }

        public function get questEngine():HabboQuestEngine
        {
            return (_questEngine);
        }


    }
}//package com.sulake.habbo.quest

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_1575 = "_-s1D" (String#32209, DoABC#4)
// _SafeStr_1617 = "_-Gi" (String#9062, DoABC#4)
// _SafeStr_1618 = "_-N2" (String#3339, DoABC#4)
// _SafeStr_162 = "_-u1p" (String#28854, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3198 = "_-S1O" (String#2743, DoABC#4)
// _SafeStr_3199 = "_-Z1u" (String#359, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_3314 = "_-j1a" (String#3394, DoABC#4)
// _SafeStr_3349 = "_-c1x" (String#1353, DoABC#4)
// _SafeStr_4403 = "_-RC" (String#4634, DoABC#4)
// _SafeStr_645 = "_-D16" (String#7521, DoABC#4)
// _SafeStr_8701 = "_-u12" (String#6423, DoABC#4)
// _SafeStr_8702 = "_-H1q" (String#14548, DoABC#4)
// _SafeStr_8703 = "_-o" (String#9509, DoABC#4)
// _SafeStr_8704 = "_-vm" (String#6712, DoABC#4)


