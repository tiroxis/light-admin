package org.lightadmin.demo.config;

import org.lightadmin.core.annotation.Administration;
import org.lightadmin.core.config.domain.configuration.EntityConfiguration;
import org.lightadmin.core.config.domain.configuration.EntityConfigurationBuilder;
import org.lightadmin.core.config.domain.context.ScreenContext;
import org.lightadmin.core.config.domain.context.ScreenContextBuilder;
import org.lightadmin.core.config.domain.fragment.Fragment;
import org.lightadmin.core.config.domain.fragment.FragmentBuilder;
import org.lightadmin.core.util.Transformer;
import org.lightadmin.demo.model.Address;

@SuppressWarnings( "unused" )
@Administration( Address.class )
public class AddressAdministration {

	public static EntityConfiguration configuration( EntityConfigurationBuilder configurationBuilder ) {
		return configurationBuilder.nameExtractor( addressNameExtractor() ).build();
	}

	public static ScreenContext screenContext( ScreenContextBuilder screenContextBuilder ) {
		return screenContextBuilder
			.screenName( "Addresses Administration" )
			.menuName( "Addresses" ).build();
	}

	public static Fragment listView( FragmentBuilder fragmentBuilder ) {
		return fragmentBuilder
			.field("country").alias( "Country")
			.field("city").alias("City")
			.field("street").alias("Street").build();
	}

	private static Transformer<Address, String> addressNameExtractor() {
		return new Transformer<Address, String>() {
			@Override
			public String apply( final Address address ) {
				return String.format( "%s, %s, %s", address.getCountry(), address.getCity(), address.getStreet() );
			}
		};
	}
}