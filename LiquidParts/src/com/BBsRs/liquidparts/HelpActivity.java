package com.BBsRs.liquidparts;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentPagerAdapter;
import android.support.v4.view.ViewPager;
import android.util.TypedValue;
import android.view.MenuItem;

import com.BBsRs.liquidparts.R;
import com.astuetz.viewpager.extensions.PagerSlidingTabStrip;

public class HelpActivity extends FragmentActivity {

	private PagerSlidingTabStrip tabs;
	private ViewPager pager;
	private MyPagerAdapter adapter;
	
	/** Called when the activity is first created. */
	@Override
	public void onCreate(Bundle savedInstanceState) {
	    super.onCreate(savedInstanceState);
	    setContentView(R.layout.activity_main);
	    getActionBar().setHomeButtonEnabled(true);
		getActionBar().setDisplayHomeAsUpEnabled(true);
	    getActionBar().setTitle(getResources().getString(R.string.app_name)+": "+getResources().getString(R.string.help));
		tabs = (PagerSlidingTabStrip) findViewById(R.id.tabs);
		tabs.setTextColorResource(R.color.white);
		tabs.setIndicatorColorResource(R.color.blue);
		tabs.setDividerColorResource(R.color.divider);
		tabs.setUnderlineColorResource(R.color.blue);
		pager = (ViewPager) findViewById(R.id.pager);
		adapter = new MyPagerAdapter(getSupportFragmentManager());
		pager.setAdapter(adapter);

		final int pageMargin = (int) TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, 4, getResources()
				.getDisplayMetrics());
		pager.setPageMargin(pageMargin);

		tabs.setViewPager(pager);
	    // TODO Auto-generated method stub
	}
	
	@Override
	public boolean onOptionsItemSelected(MenuItem item) {
	      switch (item.getItemId()) {
	          case android.R.id.home:
	        	  super. onBackPressed();
	        	  break;
	          default:
	              return super.onOptionsItemSelected(item);

	      }
		return true;
	  }
	
	public class MyPagerAdapter extends FragmentPagerAdapter {

		private final String[] TITLES = getResources().getStringArray(R.array.help);

		public MyPagerAdapter(FragmentManager fm) {
			super(fm);
		}

		@Override
		public CharSequence getPageTitle(int position) {
			return TITLES[position];
		}

		@Override
		public int getCount() {
			return TITLES.length;
		}

		@Override
		public Fragment getItem(int position) {
			return new Help(getResources().getStringArray(R.array.info)[position]);
			
		}

	}

}
