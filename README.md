**In progress**
# Rick and Morty Character Explorer

A Flutter application that showcases character details from the popular TV show "Rick and Morty", leveraging GraphQL for efficient and structured data fetching.

# Android Platform
<p align="left">
<img src="https://github.com/WebDevVenus/GraphQL_Flutter/blob/main/assets/pics/1.png" width="220" height="500" /> 
<img src="https://github.com/WebDevVenus/GraphQL_Flutter/blob/main/assets/pics/2.png" width="220" height="500" hspace="40"/>
<img src="https://github.com/WebDevVenus/GraphQL_Flutter/blob/main/assets/pics/3.png" width="220" height="500" hspace="0"/> 
</p>

## Project Structure

- `lib/main.dart`: Entry point of the application. Sets up the GraphQL client and the app theme.
- `lib/widgets/character_card.dart`: Displays a card view for each character, navigable to detailed character information.
- `lib/widgets/episode_list.dart`: Renders a list of episodes featuring the character, adapted for Android platforms.
- `lib/widgets/item_info_card.dart`: Showcases specific details about a character such as status, species, gender, origin, and location.
- `lib/widgets/my_text.dart`: A reusable text widget for consistent styling and layout across the app.
- `lib/list_of_characters.dart`: Implements the logic and UI for listing characters.
- `lib/character_details.dart`: Provides the UI for displaying detailed information about a specific character.


## Features

- **GraphQL Integration**: Utilizes the GraphQL API of the Rick and Morty series for fetching character data.
- **Character Listing**: Displays a list of characters with the ability to fetch on demand.
- **Character Details**: Provides detailed view of each character including image, status, species, gender, origin, location, and episodes.
- **Adaptive UI**: Offers platform-specific UI elements for iOS and Android.
- **Caching with HiveStore**: Implements caching mechanisms for offline data retrieval and faster access.

## GraphQL Client Integration

### `GraphQLClientProvider` Class

#### Overview
The `GraphQLClientProvider` class is an integral part of the application, responsible for setting up and managing GraphQL client operations. It interacts with the Rick and Morty GraphQL API to fetch character data.

#### Key Components

- **GraphQL Endpoint**: Defined as `_graphqlEndpoint` with the URL `https://rickandmortyapi.com/graphql`.
- **Client Initialization**:
  - **Method**: `initClient()`.
  - **Function**: Initializes a `GraphQLClient` with a `HttpLink` to the API endpoint.
  - **Caching**: Uses `GraphQLCache` with `HiveStore` for local caching, enhancing performance and enabling offline data access.
- **Fetching Characters**:
  - **Method**: `fetchCharacters(GraphQLClient client)`.
  - **Function**: Executes a GraphQL query to retrieve character information including name, image, status, species, gender, origin, location, and episode details.
  - **Error Handling**: Includes logic to manage query exceptions.
  - **Data Simplification**: Implements post-query processing to simplify character names, origins, and locations for a more concise data representation.

#### Usage
This class is used throughout the application to interact with the GraphQL API, providing a seamless and efficient mechanism for data fetching and manipulation.

#### File Path
- `lib/graphQL/graphQL_client_provider.dart`: Contains the implementation of the `GraphQLClientProvider` class.


